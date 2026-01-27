CREATE PROCEDURE RenderInitialBackground
AS
BEGIN
    DELETE FROM current_space_manifest;
    
    WITH Numbers AS (
        SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL 
        SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL 
        SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL 
        SELECT 15 UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL 
        SELECT 20 UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL 
        SELECT 25 UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29 UNION ALL 
        SELECT 30 UNION ALL SELECT 31 UNION ALL SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL 
        SELECT 35 UNION ALL SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39 UNION ALL 
        SELECT 40 UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL 
        SELECT 45 UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49 UNION ALL 
        SELECT 50 UNION ALL SELECT 51 UNION ALL SELECT 52 UNION ALL SELECT 53 UNION ALL SELECT 54 UNION ALL SELECT 55
    )
    INSERT INTO current_space_manifest (row_id, col_id, pattern_col_ref)
    SELECT r.n, c.n, ((c.n % 10) + 1)
    FROM Numbers r
    CROSS JOIN (SELECT n FROM Numbers WHERE n BETWEEN 1 AND 55) c
    WHERE r.n BETWEEN 1 AND 22;
END;
GO

CREATE PROCEDURE RenderSpace
AS
BEGIN
    UPDATE bf
    SET 
        c1  = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 1),
        c2  = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 2),
        c3  = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 3),
        c4  = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 4),
        c5  = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 5),
        
        c6  = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 6),
        c7  = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 7),
        c8  = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 8),
        c9  = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 9),
        c10 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 10),
        
        c11 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 11),
        c12 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 12),
        c13 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 13),
        c14 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 14),
        c15 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 15),
        
        c16 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 16),
        c17 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 17),
        c18 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 18),
        c19 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 19),
        c20 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 20),
        
        c21 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 21),
        c22 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 22),
        c23 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 23),
        c24 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 24),
        c25 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 25),
        
        c26 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 26),
        c27 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 27),
        c28 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 28),
        c29 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 29),
        c30 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 30),

        c31 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 31),
        c32 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 32),
        c33 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 33),
        c34 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 34),
        c35 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 35),

        c36 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 36),
        c37 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 37),
        c38 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 38),
        c39 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 39),
        c40 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 40),

        c41 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 41),
        c42 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 42),
        c43 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 43),
        c44 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 44),
        c45 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 45),

        c46 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 46),
        c47 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 47),
        c48 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 48),
        c49 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 49),
        c50 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 50),

        c51 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 51),
        c52 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 52),
        c53 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 53),
        c54 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 54),
        c55 = (SELECT CASE csm.pattern_col_ref WHEN 1 THEN sp.c1 WHEN 2 THEN sp.c2 WHEN 3 THEN sp.c3 WHEN 4 THEN sp.c4 WHEN 5 THEN sp.c5 WHEN 6 THEN sp.c6 WHEN 7 THEN sp.c7 WHEN 8 THEN sp.c8 WHEN 9 THEN sp.c9 WHEN 10 THEN sp.c10 END FROM current_space_manifest csm INNER JOIN space_pattern sp ON sp.row_id = csm.row_id WHERE csm.row_id = bf.row_id AND csm.col_id = 55)

    FROM BackframeView bf;
END;
GO

CREATE PROCEDURE RenderPillars
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX) = N'';
    
    -- Generate all column updates using CTE instead of Cursors for optimizations
    WITH PillarColumns AS (
        SELECT 
            p.pillar_id,
            p.gap_start_row,
            p.gap_height,
            col_num = p.col_start + n.num
        FROM pillars p
        CROSS JOIN (
            SELECT 0 AS num UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL
            SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8
        ) n
        WHERE p.col_start + n.num BETWEEN 1 AND 55
          AND p.col_start + n.num < p.col_start + p.pillar_width
    )
    SELECT @sql = @sql + N'
        UPDATE BackframeView
        SET c' + CAST(col_num AS NVARCHAR(10)) + N' = N''█'' 
        WHERE row_id BETWEEN 2 AND 21 
          AND (row_id < ' + CAST(gap_start_row AS NVARCHAR(10)) + N' 
               OR row_id >= ' + CAST(gap_start_row + gap_height AS NVARCHAR(10)) + N');'
    FROM PillarColumns;
    
    -- Execute all updates
    IF LEN(@sql) > 0
        EXEC sp_executesql @sql;
END;
GO


CREATE PROCEDURE RenderBird
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX) = N'';
    DECLARE @bird_row INT, @bird_col INT;
    
    -- Get bird's current position
    SELECT @bird_row = row_position, @bird_col = col_position
    FROM bird_state
    WHERE bird_id = 1;
    
    -- Generate UPDATE statements for each pixel in BirdDrawing
    WITH BirdPixels AS (
        SELECT 
            bd.col_id,
            bd.row_id,
            bd.rendered_pixel,
            -- Calculate actual position on screen
            actual_col = @bird_col + bd.col_id - 1,
            actual_row = @bird_row + bd.row_id - 1
        FROM BirdDrawing bd
    )
    SELECT @sql = @sql + N'
        UPDATE BackframeView 
        SET c' + CAST(actual_col AS NVARCHAR(10)) + N' = N''' + rendered_pixel + N''' 
        WHERE row_id = ' + CAST(actual_row AS NVARCHAR(10)) + N';'
    FROM BirdPixels
    WHERE actual_col BETWEEN 1 AND 55
      AND actual_row BETWEEN 1 AND 22;
    
    -- Execute all updates
    IF LEN(@sql) > 0
        EXEC sp_executesql @sql;
END;
GO