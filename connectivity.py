import pyodbc
import os
import keyboard
import time

SERVER = 'localhost'
DATABASE = 'db_flappy_bird_game'
conn_str = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={SERVER};DATABASE={DATABASE};Trusted_Connection=yes;'

def print_frame(rows):
    """Print a frame to console"""
    os.system('cls' if os.name == 'nt' else 'clear')
    for row in rows:
        line = ''.join(str(cell) if cell else ' ' for cell in row[1:])
        print(line)

def main():
    try:
        conn = pyodbc.connect(conn_str)
        conn.autocommit = True
        cursor = conn.cursor()
        
        # Initialize game
        print("please wait while initializing game...")
        cursor.execute("EXEC InitializeGame")
        
        print("please wait while starting game...")
        time.sleep(0.5)
        
        while True:
            user_input = 's' if keyboard.is_pressed('space') else ''
            
            cursor.execute("EXEC ProcessBackFrameReturnRenderedFrontFrame ?", user_input)
            
            # Get collision (first result set)
            collision = cursor.fetchone()[0]
            
            # Get frame (second result set)
            cursor.nextset()
            frame_rows = cursor.fetchall()
            
            print_frame(frame_rows)
            
            if collision == 1:
                print("\n\nGAME OVER!")
                break
            
            time.sleep(0.0167)  # ~30 fps
            
    except KeyboardInterrupt:
        print("\n\nGame stopped by user!")
    
    #for debugging purposes only print error
    except Exception as e:
        print(f"Error: {e}")
        
    finally:
        cursor.close()
        conn.close()

if __name__ == "__main__":
    main()