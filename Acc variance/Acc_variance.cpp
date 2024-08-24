#include <yaml-cpp/yaml.h>
#include <vector>
#include <fstream>
#include<iostream>
//g++ -o my_program Acc_variance.cpp -lyaml-cpp
using namespace std;
int main()
{
    float totalRobotAccelerations=0;
    float meanRobotAccelerations;
    float varRobotAccelerations=0;

    // float totalIMUReadings=0;
    // float meanIMUReadings;
    // float varIMUReadings;

    // float totalVariance=0;

    std::vector<float> RobotAccelerationsVector;
    // std::vector<float> IMUReadings;
    YAML::Node doc= YAML::LoadFile("Accelerometer_sensor_data.yaml");
    // YAML::Node doc2=YAML::LoadFile("Gyro_sensor_data.yaml");
/*===========================================================================================================*/
    for(int i=0;i<doc.size();i++)
    {
       float value= doc[i].as<float>();
       RobotAccelerationsVector.push_back(value);
       totalRobotAccelerations+=RobotAccelerationsVector[i];
    }
    // for(float a : RobotAccelerationsVector)
    // {
    //     std::cout<<"your data is:"<<a<<std::endl;
    // }
    meanRobotAccelerations=totalRobotAccelerations/RobotAccelerationsVector.size();
    std::cout<<"mean is:"<<meanRobotAccelerations<<std::endl;
/*=============================================================================================================*/
    // for(int i=0;i<doc2.size();i++)
    // {
    //     float value=doc2[i].as<float>();
    //     IMUReadings.push_back(value);
    //     totalIMUReadings+=IMUReadings[i];
    // }
    //     for(float a : IMUReadings)
    // {
    //     std::cout<<"your data is:"<<a<<std::endl;
    // }
    // meanIMUReadings=totalIMUReadings/IMUReadings.size();
    // std::cout<<"mean is:"<<meanIMUReadings<<std::endl;
/*===========================================================================================================*/
    for(float a : RobotAccelerationsVector)
    {
        float x = (a - meanRobotAccelerations)*(a - meanRobotAccelerations);
        varRobotAccelerations+=x;
    }
    varRobotAccelerations=varRobotAccelerations/RobotAccelerationsVector.size();
    std::cout<<"variance of Robot acceleration is:"<<varRobotAccelerations<<std::endl;
/*=========================================================================================================*/
    // for(float a : IMUReadings)
    // {
    //     float x=(a-meanIMUReadings)*(a-meanIMUReadings);
    //     varIMUReadings+=x;
    // }
    // varIMUReadings=varIMUReadings/IMUReadings.size();
    // std::cout<<"variance of IMU Readings is:"<<varIMUReadings<<std::endl;

    //The totatol variance is
    // totalVariance=(varIMUReadings+varRobotAccelerations)/2;
    // cout<<"The total gyro variance is:"<<totalVariance;
}


