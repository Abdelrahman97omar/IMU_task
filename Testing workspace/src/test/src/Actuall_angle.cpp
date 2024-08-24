#include <ros/ros.h>
#include <nav_msgs/Odometry.h>
#include <yaml-cpp/yaml.h>
#include <vector>
#include <fstream>
#include <cmath>

struct Rot{
    float x;
    float y;
    float z;
    float w;
    float yaw;
};

std::vector<Rot> rot_vector;
Rot rot;
void wheelSpeedCallback(const nav_msgs::Odometry::ConstPtr& msg) {
    rot.x = msg->pose.pose.orientation.x;
    rot.y = msg->pose.pose.orientation.y;
    rot.z = msg->pose.pose.orientation.z;
    rot.w = msg->pose.pose.orientation.w;
    rot.yaw= std::atan2(2*(rot.w*rot.z+rot.x*rot.y),1-2*(rot.y*rot.y+rot.z*rot.z))*57.29;

    rot_vector.push_back(rot);
    ROS_INFO("Current x is: %f", rot.x);
    ROS_INFO("Current y is: %f", rot.y);
    ROS_INFO("Current z is: %f", rot.z);
    ROS_INFO("Current w is: %f", rot.w);
    ROS_INFO("Current yaw is: %f", rot.yaw);

}

void saveToYaml(const std::string& filename) {
    YAML::Emitter out;
    out << YAML::BeginSeq;
    for (const auto& rot : rot_vector) {
        out << YAML::BeginMap;
        out << YAML::Key << "x" << YAML::Value << rot.x;
        out << YAML::Key << "y" << YAML::Value << rot.y;
        out << YAML::Key << "z" << YAML::Value << rot.z;
        out << YAML::Key << "w" << YAML::Value << rot.w;
        out << YAML::Key << "yaw" << YAML::Value << rot.yaw;
        out << YAML::EndMap;
    }
    out << YAML::EndSeq;

    std::ofstream fout(filename);
    fout << out.c_str();
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "calculated_Rot");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("slamware_ros_sdk_server_node/odom", 1000, wheelSpeedCallback);
    ros::Rate rate(10);  
    
    while (ros::ok()) {
        ros::spinOnce();
        rate.sleep();
    }

    saveToYaml("rotation_vector.yaml");

    return 0;
}

