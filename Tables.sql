use db_flappy_bird_game;
--------------------------------------------------------------------------------------------------------------------
-- Patterns

CREATE TABLE space_pattern (
    row_id INT PRIMARY KEY,
    c1 NCHAR(1),
    c2 NCHAR(1),
    c3 NCHAR(1),
    c4 NCHAR(1),
    c5 NCHAR(1),
    c6 NCHAR(1),
    c7 NCHAR(1),
    c8 NCHAR(1),
    c9 NCHAR(1),
    c10 NCHAR(1)
);


--background pattern
--Pattern will be repeated accross real space frame
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

--------------------------------------------------------------------------------------------------------------------
-- Space Mainfest

--current frame
CREATE TABLE current_space_manifest (
    row_id INT,
    col_id INT,
    pattern_col_ref INT, -- FK(SpacePattern) Violating FK constraint because sometime we will need orphand insertions from other rendering data components
    PRIMARY KEY CLUSTERED (row_id, col_id)
);
--------------------------------------------------------------------------------------------------------------------
-- Backframe view
CREATE TABLE BackframeView (

    row_id INT,
    c1 NVARCHAR(1), c2 NVARCHAR(1), c3 NVARCHAR(1), c4 NVARCHAR(1), c5 NVARCHAR(1),
    c6 NVARCHAR(1), c7 NVARCHAR(1), c8 NVARCHAR(1), c9 NVARCHAR(1), c10 NVARCHAR(1),
    c11 NVARCHAR(1), c12 NVARCHAR(1), c13 NVARCHAR(1), c14 NVARCHAR(1), c15 NVARCHAR(1),
    c16 NVARCHAR(1), c17 NVARCHAR(1), c18 NVARCHAR(1), c19 NVARCHAR(1), c20 NVARCHAR(1),
    c21 NVARCHAR(1), c22 NVARCHAR(1), c23 NVARCHAR(1), c24 NVARCHAR(1), c25 NVARCHAR(1),
    c26 NVARCHAR(1), c27 NVARCHAR(1), c28 NVARCHAR(1), c29 NVARCHAR(1), c30 NVARCHAR(1),
    c31 NVARCHAR(1), c32 NVARCHAR(1), c33 NVARCHAR(1), c34 NVARCHAR(1), c35 NVARCHAR(1),
    c36 NVARCHAR(1), c37 NVARCHAR(1), c38 NVARCHAR(1), c39 NVARCHAR(1), c40 NVARCHAR(1),
    c41 NVARCHAR(1), c42 NVARCHAR(1), c43 NVARCHAR(1), c44 NVARCHAR(1), c45 NVARCHAR(1),
    c46 NVARCHAR(1), c47 NVARCHAR(1), c48 NVARCHAR(1), c49 NVARCHAR(1), c50 NVARCHAR(1),
    c51 NVARCHAR(1), c52 NVARCHAR(1), c53 NVARCHAR(1), c54 NVARCHAR(1), c55 NVARCHAR(1),

    PRIMARY KEY (row_id)
);

--------------------------------------------------------------------------------------------------------------------
--Pillars
CREATE TABLE pillars (
    pillar_id INT PRIMARY KEY,
    col_start INT NOT NULL,
    gap_start_row INT NOT NULL,
    gap_height INT DEFAULT 5,
    pillar_width INT DEFAULT 9,
    is_active BIT DEFAULT 1
);

--------------------------------------------------------------------------------------------------------------------
--Bird
CREATE TABLE BirdDrawing (
    col_id TINYINT,
    row_id TINYINT,
    rendered_pixel NVARCHAR(1),
    PRIMARY KEY CLUSTERED (col_id, row_id)
);

-- Bird metadata table for position and state
CREATE TABLE bird_state (
    bird_id TINYINT PRIMARY KEY DEFAULT 1,
    row_position INT NOT NULL,
    col_position INT NOT NULL,
    is_alive BIT DEFAULT 1,
    fall_counter INT DEFAULT 0
);