CREATE PROCEDURE InitializeGame
AS
BEGIN
    EXEC PopulateGame;
    EXEC RenderInitialBackground;
END;
GO