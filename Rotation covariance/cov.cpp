#include <yaml-cpp/yaml.h>
#include <iostream>
#include <vector>
#include <cmath> 
//g++ -o my_program cov.cpp -lyaml-cpp
using namespace std;
int main() {
    YAML::Node doc = YAML::LoadFile("Imu_angles.yaml");
    std::vector<float> i_vector;
    std::vector<float> j_vector;
    std::vector<float> k_vector;
    std::vector<float> w_vector;
    std::vector<float> yaw_vector;
    float i_mean=0.0;
    float j_mean=0.0;
    float k_mean=0.0;
    float w_mean=0.0;
    float yaw_mean=0.0;

    float yaw_variance=0.0;
    float i_variance=0.0;
    float j_variance=0.0;
    float k_variance=0.0;
    float w_variance=0.0;

    float ij_cov=0.0;
    float ik_cov=0.0;
    float iw_cov=0.0;
    float jk_cov=0.0;
    float jw_cov=0.0;
    float kw_cov=0.0;


    // for (int i= 0; i < doc.size(); ++i) {
    //     YAML::Node node = doc[i];        
    //     YAML::Node myvalues = node["values"];
    //     if (myvalues.size() == 4) {
    //         i_vector.push_back(myvalues[0].as<float>());
    //         j_vector.push_back(myvalues[1].as<float>());
    //         k_vector.push_back(myvalues[2].as<float>());
    //         w_vector.push_back(myvalues[3].as<float>());
    //         }
    // }
    for (std::size_t i = 0; i < doc.size(); ++i) {
        if (doc[i].IsSequence() && doc[i].size() == 4) {
            i_vector.push_back(doc[i][0].as<float>());
            j_vector.push_back(doc[i][1].as<float>());
            k_vector.push_back(doc[i][2].as<float>());
            w_vector.push_back(doc[i][3].as<float>());
        } else {
            std::cerr << "Error: Invalid data format in the YAML file." << std::endl;
            return 1;
        }
    }
/*========================yaw vector ================================*/

    for (int i=0;i<=i_vector.size();i++)
    {
    for (std::size_t i = 0; i < i_vector.size(); ++i) {
        float yaw = atan2(2 * (w_vector[i] * k_vector[i] + i_vector[i] * j_vector[i]), 
                          1 - 2 * (j_vector[i] * j_vector[i] + k_vector[i] * k_vector[i])) * 57.2958;
        yaw_vector.push_back(yaw);
    }    }
    // /*============= For i vetor ==============*/
    // for (int i=0;i<doc.size();i+=4)
    // {   
    //     float value_i=doc[i].as<float>();
    //     i_vector.push_back(value_i);
    // }
    // for(float a: i_vector)
    // {
    //     std::cout<<a<<std::endl;
    // }
    // /*============= For j vetor ==============*/
    // for (int i=1;i<doc.size();i+=4)
    // {
    //     float value_j=doc[i].as<float>();
    //     j_vector.push_back(value_j);
    // }
    // for(float a: j_vector)
    // {
    //     std::cout<<a<<std::endl;
    // }
    // /*============= For k vetor ==============*/
    // for (int i=2;i<doc.size();i+=4)
    // {
    //     float value_k=doc[i].as<float>();
    //     k_vector.push_back(value_k);
    // }
    // for(float a: k_vector)
    // {
    //     std::cout<<a<<std::endl;
    // }
    // /*============= For w vetor ==============*/
    // for (int i=3;i<doc.size();i+=4)
    // {
    //     float value_w=doc[i].as<float>();
    //     w_vector.push_back(value_w);
    // }
    // for(float a: w_vector)
    // {
    //     std::cout<<a<<std::endl;
    // }
    /*==========================================================================================*/
    // std::cout << "i_vector: ";
    // for (float val : i_vector) {std::cout << val << " ";}
    // std::cout << "\nj_vector: ";
    // for (float val : j_vector) {std::cout << val << " "; }
    // std::cout << "\nk_vector: ";
    // for (float val : k_vector) {std::cout << val << " ";}
    // std::cout << "\nw_vector: ";
    // for (float val : w_vector) {std::cout << val << " ";}
    // cout<<endl;
    /*===========================  Mean  =======================================*/
    std::cout << "i_vector mean: "<<std::endl;
    for (float val : i_vector) 
    {
        i_mean+=val;
    }
        i_mean=i_mean/i_vector.size();
        cout<<i_mean<<endl;

    std::cout << "\nj_vector mean: ";
    for (float val : j_vector)
    {
        j_mean+=val;
    }
        j_mean=j_mean/j_vector.size();
    std::cout<<j_mean<<endl;

    std::cout << "\nk_vector mean: ";
    for (float val : k_vector)
    {
        k_mean+=val;
    }
        k_mean=k_mean/k_vector.size();
    std::cout<<k_mean<<endl;

    std::cout << "\nw_vector mean: ";
    for (float val : w_vector)
    {
        w_mean+=val;
    }
        w_mean=w_mean/w_vector.size();
    std::cout<<w_mean<<endl;

    std::cout << "\nyaw_vector mean: ";
    for (float val : yaw_vector)
    {
        yaw_mean+=val;
    }
        yaw_mean=yaw_mean/yaw_vector.size();
    std::cout<<yaw_mean<<endl;
    /*============================      variance     =============================================*/
    
    std::cout << "\ni_vector variance: ";
    for (float val : i_vector) 
    {
        i_variance+=(val-i_mean)*(val-i_mean);
    }
        i_variance=i_variance/i_vector.size();
        cout<<i_variance<<endl;

    std::cout << "\nj_vector variance: ";
    for (float val : j_vector)
    {
        j_variance+=(val-j_mean)*(val-j_mean);
    }
        j_variance=j_variance/j_vector.size();
    std::cout<<j_variance<<endl;

    std::cout << "\nk_vector variance: ";
    for (float val : k_vector)
    {
        k_variance+=(val-k_mean)*(val-k_mean);
    }
        k_variance=k_variance/k_vector.size();
    std::cout<<k_variance<<endl;

    std::cout << "\nw_vector variance: ";
    for (float val : w_vector)
    {
        w_variance+=(val-w_mean)*(val-w_mean);
    }
        w_variance=w_variance/w_vector.size();
    std::cout<<w_variance<<endl;

    std::cout << "\nyaw_vector variance: ";
    for (float val : yaw_vector)
    {
        yaw_variance+=(val-yaw_mean)*(val-yaw_mean);
    }
        yaw_variance=yaw_variance/yaw_vector.size();
    std::cout<<yaw_variance<<endl;
/*===================================================================================*/

    for(int i;i<=i_vector.size();i++)
    {
        ij_cov+=(i_vector[i]-i_mean)* (j_vector[i]-j_mean);
        ik_cov+=(i_vector[i]-i_mean)* (k_vector[i]-k_mean);
        iw_cov+=(i_vector[i]-i_mean)* (w_vector[i]-w_mean);
        jk_cov+=(j_vector[i]-j_mean)* (k_vector[i]-k_mean);
        jw_cov+=(j_vector[i]-j_mean)* (w_vector[i]-w_mean);
        kw_cov+=(k_vector[i]-k_mean)* (w_vector[i]-w_mean);
    }
    ij_cov /= i_vector.size();
    ik_cov /= i_vector.size();
    iw_cov /= i_vector.size();
    jk_cov /= i_vector.size();
    jw_cov /= i_vector.size();
    kw_cov /= i_vector.size();

        cout<<"ij_cov:"<<ij_cov<<endl;
        cout<<"ik_cov:"<<ik_cov<<endl;
        cout<<"iw_cov:"<<iw_cov<<endl;
        cout<<"jk_cov:"<<jk_cov<<endl;
        cout<<"jw_cov:"<<jw_cov<<endl;
        cout<<"kw_cov:"<<kw_cov<<endl;
    return 0;
}
