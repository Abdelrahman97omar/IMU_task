#include <ros/ros.h>
#include <std_msgs/Float32MultiArray.h>
#include <yaml-cpp/yaml.h>
#include <vector>
#include <fstream>

std::vector<float> rot_speed_vector;
float left_wheel_speed=0.0;
float right_wheel_speed=0.0;
const float wheel_radius = 0.082;  
const float wheel_separation=0.358;
float base_angle=0.0;
void wheelSpeedCallback(const std_msgs::Float32MultiArray::ConstPtr& msg) {
    left_wheel_speed = msg->data[0];
    right_wheel_speed= msg->data[1];
    float base_rot_velocity=(left_wheel_speed-right_wheel_speed)/wheel_separation;
    rot_speed_vector.push_back(base_rot_velocity);
    ROS_INFO("Current Angular speed is: %f", base_rot_velocity);
}

void saveToYaml(const std::string& filename) {
    YAML::Emitter out;
    out << YAML::BeginSeq;
    for (float RotSpeed : rot_speed_vector) {
        out << RotSpeed;
    }
    out << YAML::EndSeq;

    std::ofstream fout(filename);
    fout << out.c_str();
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "calculated_rot_speed");
    ros::NodeHandle nh;

    ros::Subscriber sub = nh.subscribe("/wheel_speeds", 1000, wheelSpeedCallback);

    ros::Rate rate(10);  
    
    while (ros::ok()) {
        ros::spinOnce();
        rate.sleep();
    }
    saveToYaml("angular_velocity_vector.yaml");

    return 0;
}

