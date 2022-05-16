% Dobot Magician Specs: https://www.dobot.cc/dobot-magician/specification.html

classdef myDobotRail < handle
    properties
        model;
        workspace = [-0.8 0.8 -0.4 0.4 -0.01 0.5];  % define the boundaries of the workspace
    end

    methods
        function self = myDobotRail()
            self.GetDobot();    %calls GetDobot function
            self.PlotDobot();   %calls PlotDobot function
        end

        function GetDobot(self)
            pause(0.001);

            % Create the Dobot model mounted on a linear rail
            L(1) = Link([pi     0       0       pi/2   1]); % link for linear rail
            L(2) = Link([0      0.103   0       pi/2   0]);
            L(3) = Link([0      0       0.135   0      0]);
            L(4) = Link([0      0       0.147   0      0]);
            L(5) = Link([0      0       0.0385  -pi/2  0]);
            L(6) = Link([0      0       0       0	   0]);

            % Incorporate joint limits
            L(1).qlim = [-0.5 0.5];
            L(2).qlim = deg2rad([-135 135]);
            L(3).qlim = deg2rad([5    80]);
            L(4).qlim = deg2rad([15   170]);
            L(5).qlim = deg2rad([-90  90]);
            L(6).qlim = deg2rad([-85  85]);

            L(4).offset = -pi;

            self.model = SerialLink(L,'name','myDobot');
            
            % Rotate robot to the correct orientation
            self.model.base = self.model.base * transl(0,0,0.075) * trotx(pi/2) * troty(pi/2);
        end

        function PlotDobot(self)
            scale = 1.0; % scale option
            q = deg2rad([0 0 70 30 80 0]); % starting joint angles
            self.model.plot(q,'workspace',self.workspace,'scale',scale) % plot the robot
            %self.model.teach; % open teach functionality for testing purposes
            self.model.delay = 0; % set delay to 0 to speed up animation in trajectory
        end
        
    end
end

%% For use in main script
% q = dobot.getpos();     % Get the joint angles at the current position        
% J = dobot.jacob0(q);