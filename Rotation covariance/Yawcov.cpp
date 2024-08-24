#include <yaml-cpp/yaml.h>
#include <iostream>
#include <vector>
//g++ -o my_program Yawcov.cpp -lyaml-cpp
using namespace std;
int main() {
    YAML::Node doc = YAML::LoadFile("Imu_Yaw_angles.yaml");
    std::vector<float> yaw_vector;
    float yaw_mean=0.0;
    float yaw_variance=0.0;


    for (int i= 0; i < doc.size(); ++i) {
        float value = doc[i].as<float>();  
        yaw_vector.push_back(value); 
    }
    std::cout << "yaw_vector: ";
    for (const auto& val : yaw_vector) {
        std::cout << val << std::endl;
    }
   
    /*===========================  Mean  =======================================*/
    std::cout << "yaw_vector mean: "<<std::endl;
    for (float val : yaw_vector) 
    {
        yaw_mean+=val;
    }
        yaw_mean=yaw_mean/yaw_vector.size();
        std::cout<<yaw_mean<<endl;
    /*============================      variance     =============================================*/
    
    std::cout << "\nyaw_vector variance: ";
    for (float val : yaw_vector) 
    {
        yaw_variance+=(val-yaw_mean)*(val-yaw_mean);
    }
        yaw_variance=yaw_variance/yaw_vector.size();
        std::cout<<yaw_variance<<endl;

    return 0;
}
