-- This script is to populate the database with initial values in order for the procedures to work
CREATE OR ALTER PROCEDURE InitializeGame
AS
BEGIN
    -- Initialize BackframeView
    TRUNCATE TABLE BackframeView;
    INSERT INTO BackframeView (row_id)
    SELECT TOP 22 ROW_NUMBER() OVER (ORDER BY (SELECT NULL))
    FROM sys.objects;

    -- Initialize repeating pattern
    TRUNCATE TABLE space_pattern;
    INSERT INTO space_pattern (row_id, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10) VALUES
    (1, N'█', N'█', N'█', N'█', N'█', N'█', N'█', N'█', N'█', N'█'),
    (2,  N'░', N'.', N'░', N'░', N'.', N'░', N'.', N'.', N'░', N'.'),
    (3,  N'.', N'░', N'.', N'.', N'░', N'.', N'░', N'.', N'.', N'░'),
    (4,  N'░', N'░', N'.', N'░', N'.', N'.', N'░', N'░', N'.', N'.'),
    (5,  N'.', N'.', N'░', N'.', N'░', N'░', N'.', N'.', N'░', N'.'),
    (6,  N'░', N'.', N'.', N'░', N'.', N'.', N'░', N'.', N'.', N'░'),
    (7,  N'.', N'░', N'░', N'.', N'.', N'░', N'.', N'░', N'░', N'.'),
    (8,  N'░', N'.', N'░', N'.', N'░', N'.', N'.', N'░', N'.', N'░'),
    (9,  N'.', N'░', N'.', N'░', N'.', N'░', N'░', N'.', N'.', N'.'),
    (10,  N'░', N'░', N'.', N'.', N'░', N'.', N'.', N'░', N'░', N'.'),
    (11, N'.', N'.', N'░', N'░', N'.', N'.', N'░', N'.', N'.', N'░'),
    (12, N'░', N'.', N'.', N'░', N'.', N'░', N'.', N'.', N'░', N'.'),
    (13, N'.', N'░', N'.', N'.', N'░', N'.', N'░', N'░', N'.', N'░'),
    (14, N'░', N'░', N'.', N'░', N'.', N'.', N'.', N'░', N'.', N'.'),
    (15, N'.', N'.', N'░', N'.', N'.', N'░', N'░', N'.', N'░', N'.'),
    (16, N'░', N'.', N'.', N'░', N'░', N'.', N'.', N'.', N'.', N'░'),
    (17, N'.', N'░', N'░', N'.', N'.', N'.', N'░', N'.', N'░', N'.'),
    (18, N'░', N'.', N'░', N'.', N'░', N'.', N'.', N'░', N'.', N'░'),
    (19, N'.', N'░', N'.', N'░', N'.', N'░', N'.', N'.', N'░', N'.'),
    (20, N'░', N'░', N'.', N'.', N'.', N'.', N'░', N'░', N'.', N'.'),
    (21, N'.', N'.', N'░', N'░', N'.', N'░', N'.', N'.', N'░', N'░'),
    (22, N'█', N'█', N'█', N'█', N'█', N'█', N'█', N'█', N'█', N'█');

    -- Initialize pillars
    TRUNCATE TABLE pillars;
    INSERT INTO pillars (pillar_id, col_start, gap_start_row, gap_height, pillar_width)
    VALUES 
        (1, 8, 8, 6, 5),
        (2, 25, 11, 6, 5),
        (3, 42, 9, 6, 5);

    -- Populate BirdDrawing
    TRUNCATE TABLE BirdDrawing;
    INSERT INTO BirdDrawing VALUES (1, 1, N'█');
    INSERT INTO BirdDrawing VALUES (1, 2, N'    ');

    INSERT INTO BirdDrawing VALUES (2, 1, N'0');
    INSERT INTO BirdDrawing VALUES (2, 2, N'█');

    INSERT INTO BirdDrawing VALUES (3, 1, N'>');
    INSERT INTO BirdDrawing VALUES (3, 2, N'█');

    -- Populate bird_state
    TRUNCATE TABLE bird_state;
    INSERT INTO bird_state (bird_id, row_position, col_position, velocity, is_alive)
    VALUES (1, 10, 5, -2, 1);
END;
GO

