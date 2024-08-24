#include <ros/ros.h>
#include <std_msgs/Float32MultiArray.h>
#include <std_msgs/Float32.h>
#include <yaml-cpp/yaml.h>
#include <vector>
#include <fstream>

std::vector<float> acc_vector;
std::vector<float> base_velocity_vec;
//std::iterator it<flost>=base_velocity_vec.begin();
float previous_velocity = 0.0;
float left_wheel_speed = 0.0;
float right_wheel_speed = 0.0;
const float wheel_radius = 0.0695;
int no_of_samples = 0;
ros::Time last_push_time;
std_msgs::Float32 Acc;

void wheelSpeedCallback(const std_msgs::Float32MultiArray::ConstPtr& msg) {

    // float left_wheel_speed = msg->data[0]*-1;
    // float right_wheel_speed =msg->data[1]*-1;
    float left_wheel_speed = msg->data[0];
    float right_wheel_speed =msg->data[1];
    
    if(left_wheel_speed<0.0)
    {
        left_wheel_speed*=-1;
        right_wheel_speed*=-1;
    }
    float base_velocity = (left_wheel_speed + right_wheel_speed) / 2.0;
    ros::Time current_time = ros::Time::now();
    float time_diff = (current_time - last_push_time).toSec();

    ROS_INFO("==================================================");
    ROS_INFO("Time diff: %f", time_diff);
    ROS_INFO("Base velocity: %f", base_velocity);
    ROS_INFO("Previous velocity: %f", previous_velocity);

    if (time_diff >= 0.09 && time_diff <= 0.11 ) {
        base_velocity_vec.push_back(base_velocity);
        ROS_INFO("Base velocity pushed to vector: %f", base_velocity);

        // Calculate and publish acceleration
        Acc.data = (base_velocity - previous_velocity) / time_diff;
        acc_vector.push_back(Acc.data);

        last_push_time = current_time;
        //no_of_samples++;
        previous_velocity = base_velocity;
    }
    else
    {
        last_push_time =ros::Time::now();
    }
}

void saveToYaml(const std::string& filename) {
    YAML::Emitter out;
    out << YAML::BeginSeq;
    for (float acc : acc_vector) {
        out << acc;
    }
    out << YAML::EndSeq;

    std::ofstream fout(filename);
    fout << out.c_str();
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "calculated_Acc");
    ros::NodeHandle nh;

    ros::Subscriber sub = nh.subscribe("/wheel_speeds", 1, wheelSpeedCallback);
    ros::Publisher pub = nh.advertise<std_msgs::Float32>("acc_pub", 100);
    ros::Rate rate(10);

    last_push_time = ros::Time::now();

    while (ros::ok() && no_of_samples <= 500) {
        rate.sleep();
        ros::spinOnce();
        pub.publish(Acc);
    }

    // Save acceleration vector to a YAML file
    saveToYaml("acc_vector.yaml");

    return 0;
}
