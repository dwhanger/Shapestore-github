using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Amazon.AutoScaling;
using Amazon.AutoScaling.Model;

namespace Pluralsight.ShapeStore.AutoScaling
{
    class Program
    {
        static void Main(string[] args)
        {
            AmazonAutoScalingClient client = new AmazonAutoScalingClient();

            if( args[0] == "config")
            {
                CreateAutoScalingLaunchConfig(client);
            } 
            else if (args[0] == "create")
            {
                CreateAutoScalingGroup(client);
            }
            else if (args[0] == "describe")
            {
                DescribeAutoScaling(client);
            }
            else if (args[0] == "cleanup")
            {
                Cleanup(client);
            }
            else
            {
                Console.WriteLine("don't recognize the command line parm....");
            }
            
        }

        private static void CreateAutoScalingLaunchConfig(AmazonAutoScalingClient client)
        {
            Console.WriteLine("Creating Auto Scaling Launch Configuration ...");

            CreateLaunchConfigurationRequest request = new CreateLaunchConfigurationRequest();
            request.LaunchConfigurationName = "dmw-scale-web";
            request.ImageId = "ami-1712d877"; //unique AMI instance ID
            request.InstanceType = "t2.micro";  //type of instance
            request.SecurityGroups = new List<string>() { "WebRDPGroup" }; //list of groups to associate it with
            request.IamInstanceProfile = "AutoScaleRole";   //include IAM role that server runs under
            
            InstanceMonitoring doMonitor = new InstanceMonitoring() {Enabled = false};
            request.InstanceMonitoring = doMonitor;
            request.KeyName = "newstack-keypair"; //name of EC2 keypair to use

            CreateLaunchConfigurationResponse response = client.CreateLaunchConfiguration(request);

            Console.WriteLine("Response is ... " + response.ResponseMetadata.RequestId);
            Console.ReadLine();
        }

        private static void CreateAutoScalingGroup(AmazonAutoScalingClient client)
        {
            Console.WriteLine("Creating Auto Scaling Group Configuration ...");

            CreateAutoScalingGroupRequest request = new CreateAutoScalingGroupRequest();
            request.AutoScalingGroupName = "dmw-scale-web-asg";
            request.LaunchConfigurationName = "dmw-scale-web";
            request.AvailabilityZones = new List<string>() { "us-west-2a" };
            request.MinSize = 2;    //fewest number of severs to run
            request.MaxSize = 4;    //most number of servers to run
            request.DesiredCapacity = 2;  //ideal count of servres
            request.DefaultCooldown = 600;  //how long to wait before allowing Auto Scaling to occur again
            request.HealthCheckType = "EC2";
            request.HealthCheckGracePeriod = 300; //how long after coming online to start checking new server health 
            request.LoadBalancerNames = new List<string>() { "dmw-shapestore-elb" };

            CreateAutoScalingGroupResponse response = client.CreateAutoScalingGroup(request);

            Console.WriteLine("Response is  ... " + response.ResponseMetadata.RequestId);
            Console.ReadLine();
        }

        private static void DescribeAutoScaling(AmazonAutoScalingClient client)
        {
            DescribeLaunchConfigurationsRequest launchRequest = new DescribeLaunchConfigurationsRequest();
            launchRequest.LaunchConfigurationNames = new List<string>() { "dmw-scale-web" };

            DescribeAutoScalingGroupsRequest groupRequest = new DescribeAutoScalingGroupsRequest();
            groupRequest.AutoScalingGroupNames = new List<string>() { "dmw-scale-web-asg" };
            

            DescribeLaunchConfigurationsResponse launchResponse = client.DescribeLaunchConfigurations(launchRequest);
            Console.WriteLine(":: Launch configuration ::");
            Console.WriteLine("Name: " + launchResponse.DescribeLaunchConfigurationsResult.LaunchConfigurations[0].LaunchConfigurationName);
            Console.WriteLine("AMI: " + launchResponse.DescribeLaunchConfigurationsResult.LaunchConfigurations[0].ImageId);
            Console.WriteLine("Key Pair: " + launchResponse.DescribeLaunchConfigurationsResult.LaunchConfigurations[0].KeyName);
            Console.WriteLine("Type: " + launchResponse.DescribeLaunchConfigurationsResult.LaunchConfigurations[0].InstanceType);
            Console.WriteLine("");

            DescribeAutoScalingGroupsResponse groupResponse = client.DescribeAutoScalingGroups(groupRequest);
            Console.WriteLine(":: Group setup ::");
            Console.WriteLine("Name: " + groupResponse.DescribeAutoScalingGroupsResult.AutoScalingGroups[0].AutoScalingGroupName);
            Console.WriteLine("Desired Capacity: " + groupResponse.DescribeAutoScalingGroupsResult.AutoScalingGroups[0].DesiredCapacity.ToString());
            Console.WriteLine("");

            DescribeAutoScalingInstancesResponse instanceResponse = client.DescribeAutoScalingInstances();
            foreach (AutoScalingInstanceDetails instance in instanceResponse.DescribeAutoScalingInstancesResult.AutoScalingInstances)
            {
                Console.WriteLine("Group: " + instance.AutoScalingGroupName + "; ID: " + instance.InstanceId);
            }
            

            Console.ReadLine();
        }

        private static void Cleanup(AmazonAutoScalingClient client)
        {
            DeleteAutoScalingGroupRequest groupDelete = new DeleteAutoScalingGroupRequest();
            groupDelete.AutoScalingGroupName = "dmw-scale-web-asg";
            groupDelete.ForceDelete = true;

            DeleteAutoScalingGroupResponse groupResponse = client.DeleteAutoScalingGroup(groupDelete);

            DeleteLaunchConfigurationRequest launchDelete = new DeleteLaunchConfigurationRequest();
            launchDelete.LaunchConfigurationName = "dmw-scale-web";

            DeleteLaunchConfigurationResponse launchResponse = client.DeleteLaunchConfiguration(launchDelete);

            Console.WriteLine("Cleanup completed");
            Console.ReadLine();
        }
    }
}
