#include <yaml-cpp/yaml.h>
#include <vector>
#include <fstream>
#include<iostream>
//g++ -o my_program cov.cpp -lyaml-cpp
using namespace std;
int main()
{
    float totalRobotAngularVelocties=0;
    float meanRobotAngularVelocties;
    float varRobotAngularVelocties=0;

    std::vector<float> RobotAngularVelocties;
    std::vector<float> IMUReadings;
    YAML::Node doc= YAML::LoadFile("angular_velocity_vector.yaml");
/*===========================================================================================================*/
    for(int i=0;i<doc.size();i++)
    {
       float value= doc[i].as<float>();
       RobotAngularVelocties.push_back(value);
       totalRobotAngularVelocties+=RobotAngularVelocties[i];
    }
    meanRobotAngularVelocties=totalRobotAngularVelocties/RobotAngularVelocties.size();
    std::cout<<"mean is:"<<meanRobotAngularVelocties<<std::endl;
/*=============================================================================================================*/
    for(float a : RobotAngularVelocties)
    {
        float x = (a - meanRobotAngularVelocties)*(a - meanRobotAngularVelocties);
        varRobotAngularVelocties+=x;
    }
    varRobotAngularVelocties=varRobotAngularVelocties/RobotAngularVelocties.size();
    std::cout<<"variance of Robot angular velocity is:"<<varRobotAngularVelocties<<std::endl;
/*=========================================================================================================*/
}


