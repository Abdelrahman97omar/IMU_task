import serial
import yaml
import time
import os

counter = 0

try:
    ser = serial.Serial('/dev/ttyACM1', 115200, timeout=1)  
    print("Serial port opened successfully.")
except serial.SerialException as e:
    print(f"Error: {e}")
    exit()

data = []

try:
    time.sleep(2)  

    while counter < 1000:
        try:
            if ser.in_waiting > 0:
                line = ser.readline().decode('utf-8').rstrip()
                print(f"Received: {line}")

                if "Gyr x:" in line:
                    print("Detected 'Gyroscope' in line.")
                    try:
                        parts = line.split()
                        print(f"Parts: {parts}")

                        # Extract the values using the correct parts
                        gyro_x = float(parts[1].split(':')[1])
                        gyro_y = float(parts[3].split(':')[1])
                        gyro_z = float(parts[5].split(':')[1])
                        gyro_values = [gyro_x, gyro_y, gyro_z]
                        data.append({"type": "gyroscope", "values": gyro_values})
                        counter += 1  
                        print(f"Counter incremented: {counter}")
                    except (ValueError, IndexError) as e:
                        print(f"Parsing error: {e}")
                        continue

                print(f"Counter: {counter}")

        except serial.SerialException as e:
            print(f"Serial read error: {e}")
            break

except KeyboardInterrupt:
    print("Exiting...")

finally:
    ser.close()
    print("Serial port closed.")

    # Create the directory if it does not exist
    os.makedirs(os.path.expanduser('~/data'), exist_ok=True)

    # Save to YAML file
    with open(os.path.expanduser('~/data/Gyro_sensor_data.yaml'), 'w') as file:
        yaml.dump(data, file)
        print("Data saved to ~/data/Gyro_sensor_data.yaml")
