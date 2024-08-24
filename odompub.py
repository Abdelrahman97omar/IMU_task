import rospy
from nav_msgs.msg import Odometry
msg = Odometry()
msg.header.frame_id='base_link'
msg.pose.pose.orientation.x=0
msg.pose.pose.orientation.y=0
msg.pose.pose.orientation.z=0.38
msg.pose.pose.orientation.w=0.92
msg.pose.pose.position.x=1
msg.pose.pose.position.y=1
rospy.init_node('my_node',)
pub=rospy.Publisher('slamware_ros_sdk_server_node/odom',Odometry,queue_size=10)

rate=rospy.Rate(10)
while not rospy.is_shutdown():
    pub.publish(msg)
    rate.sleep()