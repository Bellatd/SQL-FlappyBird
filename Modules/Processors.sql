-- Run it to populate the table
CREATE PROCEDURE ProcessBackground
AS
BEGIN
    UPDATE current_space_manifest
    SET pattern_col_ref = CASE 
                            -- If we are at the bottom (1), wrap around to top (10)
                            WHEN pattern_col_ref = 1 THEN 10 
                            -- Otherwise, just step down by 1
                            ELSE pattern_col_ref - 1 
                          END
    WHERE row_id BETWEEN 2 AND 22;
END
GO

CREATE PROCEDURE ProcessPillars
AS
BEGIN
    -- Respawn pillars BEFORE moving (check if NEXT position would be <= 0)
    UPDATE pillars
    SET col_start = 55,
        gap_start_row = 4 + ABS(CHECKSUM(NEWID())) % 14
    WHERE col_start - 1 <= 0;
    
    -- Then move all pillars 1 column to the left
    UPDATE pillars
    SET col_start = col_start - 1;
END
GO

CREATE PROCEDURE ProcessBird
    @input CHAR(1) = NULL
AS
BEGIN
    DECLARE @fall_counter INT;
    
    -- Get current fall counter
    SELECT @fall_counter = fall_counter FROM bird_state WHERE bird_id = 1;
    
    IF @input = 's'  -- Space character
    BEGIN
        -- Move bird UP by 1 row immediately
        UPDATE bird_state
        SET row_position = row_position - 1,
            fall_counter = 0  -- Reset fall counter on jump
        WHERE bird_id = 1 AND row_position > 2;  -- Don't go above row 2
    END
    ELSE
    BEGIN
        -- Increment fall counter
        SET @fall_counter = @fall_counter + 1;
        
        -- Only fall every 2 frames (adjust this number for slower fall)
        IF @fall_counter >= 2
        BEGIN
            UPDATE bird_state
            SET row_position = row_position + 1,
                fall_counter = 0
            WHERE bird_id = 1 AND row_position < 21;  -- Don't go below row 21
        END
        ELSE
        BEGIN
            UPDATE bird_state
            SET fall_counter = @fall_counter
            WHERE bird_id = 1;
        END
    END
END;
GO

CREATE PROCEDURE DetectCollision
AS
BEGIN
    DECLARE @bird_row INT, @bird_col INT;
    DECLARE @collision BIT = 0;
    
    -- Get bird position
    SELECT @bird_row = row_position, @bird_col = col_position
    FROM bird_state
    WHERE bird_id = 1;
    
    -- Check if bird overlaps with first nearest pillar
    IF EXISTS (
        SELECT 1
        FROM pillars p
        WHERE p.col_start <13
          AND @bird_col BETWEEN p.col_start AND (p.col_start + p.pillar_width - 1)
          AND (@bird_row < p.gap_start_row OR @bird_row >= (p.gap_start_row + p.gap_height))
          AND p.is_active = 1
    )
    BEGIN
        SET @collision = 1;
    END
    
    -- Update bird state if collision detected
    IF @collision = 1
    BEGIN
        UPDATE bird_state
        SET is_alive = 0
        WHERE bird_id = 1;
    END
    
    -- Return collision status
    SELECT @collision AS collision_detected;
END;
GO