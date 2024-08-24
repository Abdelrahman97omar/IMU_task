import serial
import yaml
import time
import os
import rospy
from std_msgs.msg import Float32
from std_msgs.msg import Float32MultiArray
base_velocity=0.0

def callback(msg):
    right_wheel_speed= msg.data[0]
    left_wheel_speed = msg.data[1]
    global base_velocity
    global velToTakeAcc
    base_velocity = float((right_wheel_speed+left_wheel_speed)/2)
    velToTakeAcc =base_velocity
    if base_velocity<0.0:
        velToTakeAcc =base_velocity*-1

    

rospy.init_node('acceleration_publisher')
pubACC = rospy.Publisher('/acc_data', Float32, queue_size=10)
pubVEL = rospy.Publisher('/vel_data', Float32, queue_size=10)
rospy.Subscriber("wheel_speeds", Float32MultiArray, callback)
pub_freq =rospy.Rate(100)
try:
    ser = serial.Serial('/dev/ttyACM1', 115200, timeout=1)  # Adjust the port if necessary
    print("Serial port opened successfully.")
except serial.SerialException as e:
    print(f"Error: {e}")
    exit()

accX_vector = []

try:
    time.sleep(2)  # Wait for 2 seconds to ensure the Arduino is ready

    while not rospy.is_shutdown():
        # print("reading data")
        if ser.in_waiting > 0:
            line = ser.readline().decode('utf-8').rstrip()
            if line.startswith("ACCELEROMETER: "):
                    acc_x = float(line.split()[1])+0.5
                    pubACC.publish(acc_x)
                    if velToTakeAcc>0.69 and velToTakeAcc<0.71:
                        print("receved")
                        accX_vector.append(acc_x)    

        pubVEL.publish(base_velocity)
        pub_freq.sleep()
except KeyboardInterrupt:
    print("Exiting...")

finally:
    ser.close()
    print("Serial port closed.")

os.makedirs(os.path.expanduser('~/data'), exist_ok=True)
with open(os.path.expanduser('~/data/Accelerometer_sensor_data.yaml'), 'w') as file:
       yaml.dump(accX_vector, file)
       print("Data saved to ~/data/Acc_sensor_data.yaml")


rospy.spin()
