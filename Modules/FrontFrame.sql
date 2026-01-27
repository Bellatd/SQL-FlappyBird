-- This procedure is the main entry point for the game. It will process the game frame and return the updated backframe view.

CREATE PROCEDURE ProcessBackFrameReturnRenderedFrontFrame
    @input CHAR(1) = NULL
AS
BEGIN
    SET NOCOUNT ON;  -- Prevent extra result sets
    
    DECLARE @collision BIT = 0;
    
    -- 1. Process background scrolling
    EXEC ProcessBackground;
    
    -- 2. Process pillars movement
    EXEC ProcessPillars;
    
    -- 3. Process bird movement
    EXEC ProcessBird @input;
    
    -- 4. Detect collision
    EXEC DetectCollision;
    
    -- Get collision status
    SELECT @collision = CASE WHEN is_alive = 0 THEN 1 ELSE 0 END
    FROM bird_state
    WHERE bird_id = 1;
    
    -- 5. Render everything
    EXEC RenderSpace;
    EXEC RenderPillars;
    EXEC RenderBird;
    
    -- Return frame as first result
    SELECT * FROM BackframeView ORDER BY row_id;
        
    -- Return collision status as second result
    SELECT @collision AS collision_detected;
END;
GO