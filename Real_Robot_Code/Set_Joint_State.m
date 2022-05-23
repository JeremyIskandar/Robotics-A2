function [] = Set_Joint_State(q1,q2,q3,q4)

jointTarget = [q1,q2,q3,q4]; % Remember that the Dobot has 4 joints by default.

[targetJointTrajPub,targetJointTrajMsg] = rospublisher('/dobot_magician/target_joint_states');
trajectoryPoint = rosmessage("trajectory_msgs/JointTrajectoryPoint");
trajectoryPoint.Positions = jointTarget;
targetJointTrajMsg.Points = trajectoryPoint;

send(targetJointTrajPub,targetJointTrajMsg);

end