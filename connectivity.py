import pyodbc
import os
import sys
import keyboard
import time

SERVER = 'localhost'
DATABASE = 'db_flappy_bird_game'
conn_str = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={SERVER};DATABASE={DATABASE};Trusted_Connection=yes;'

def enable_ansi_windows():
    if os.name == 'nt':
        import ctypes
        kernel32 = ctypes.windll.kernel32
        kernel32.SetConsoleMode(kernel32.GetStdHandle(-11), 7)

def print_frame_fast(rows):
    output_buffer = ["\033[H"] 
    for row in rows:
        line = ''.join(str(cell) if cell else ' ' for cell in row[1:])
        output_buffer.append(line)
    sys.stdout.write('\n'.join(output_buffer))
    sys.stdout.flush()

def main():
    enable_ansi_windows()
    os.system('cls' if os.name == 'nt' else 'clear')
    
    try:
        conn = pyodbc.connect(conn_str)
        conn.autocommit = True
        cursor = conn.cursor()
        
        print("Initializing game...")
        cursor.execute("EXEC InitializeGame")
        
        print("Starting...")
        time.sleep(0.5)
        
        os.system('cls' if os.name == 'nt' else 'clear')

        while True:
            user_input = 's' if keyboard.is_pressed('space') else ''
            
            cursor.execute("EXEC ProcessBackFrameReturnRenderedFrontFrame ?", user_input)
            
            collision = cursor.fetchone()[0]
            
            cursor.nextset()
            frame_rows = cursor.fetchall()
            
            print_frame_fast(frame_rows)
            
            if collision == 1:
                sys.stdout.write(f"\033[{len(frame_rows)+2}H") 
                print("\nGAME OVER!")
                break
            
    except KeyboardInterrupt:
        sys.stdout.write("\nGame stopped!\n")
    except Exception as e:
        sys.stdout.write(f"\nError: {e}\n")
    finally:
        if 'cursor' in locals(): cursor.close()
        if 'conn' in locals(): conn.close()

if __name__ == "__main__":
    main()