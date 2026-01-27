# Flappy Bird SQL Game

A Flappy Bird game implemented entirely in SQL Server, running at 30 or 60 frames per second.

## How It Works

The game follows a 2-step cycle for each component:

1. **Process**: Each frame, process procedures update the manifest tables by calculating new positions, applying physics, and handling game logic.

2. **Render**: Rendering procedures read from the manifest tables and update the display table using SQL UPDATE statements.

This architecture allows the entire game loop to run within SQL Server without external game engines.

## Setup

**Option 1:**
Create a database named `db_flappy_bird_game` in MS SQL Server and connect using Windows Authentication.

**Option 2:**
Set up your own `connectivity.py` configuration.

## Installation Steps

1. Run `Tables.sql` to create all required tables.

2. Run all scripts in the `Modules` folder in any order:
   - FrontFrame.sql
   - Processors.sql
   - Rendering.sql

3. Run Populating.sql to create the procedure that will populate the game data by running:
   - Populating.sql

4. Create the initialization procedure by running
   - Initialize.sql

5. Run the game:
   ```
   python connectivity.py
   ```

## Performance

The game runs at 30 fps by default. To run at 60 fps, modify the sleep time in `connectivity.py` from `0.033` to `0.016`.

## Controls

Press spacebar to make the bird jump.
