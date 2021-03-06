% Dobot Magician Specs: https://www.dobot.cc/dobot-magician/specification.html

classdef myDobotRail < handle
    properties
        model;
        workspace = [-0.8 0.8 -0.4 0.4 -0.01 0.5];          % Define the boundaries of the workspace
    end

    methods
        function self = myDobotRail()
            self.GetDobot();                                % Calls GetDobot function
            self.PlotDobot();                               % Calls PlotDobot function
        end

        function GetDobot(self)
            pause(0.001);

            % Create the Dobot model mounted on a linear rail:
            L(1) = Link([pi     0       0       pi/2   1]); % Link for linear rail
            L(2) = Link([0      0.103   0       pi/2   0]);
            L(3) = Link([0      0       0.135   0      0]);
            L(4) = Link([0      0       0.147   0      0]);
            L(5) = Link([0      0       0.0385  -pi/2  0]);
            L(6) = Link([0      0       0       0	   0]);

            % Incorporate joint limits:
            L(1).qlim = [-0.5 0.5];
            L(2).qlim = deg2rad([-135 135]);
            L(3).qlim = deg2rad([5    80]);
            L(4).qlim = deg2rad([15   170]);
            L(5).qlim = deg2rad([-90  90]);
            L(6).qlim = deg2rad([-85  85]);

            L(4).offset = -pi;

            self.model = SerialLink(L,'name','myDobot');    % Define name of robot model
            
            % Rotate robot to the correct position and orientation on table:
            self.model.base = self.model.base * transl(0,0,0.075) * trotx(pi/2) * troty(pi/2);
        end

        function PlotDobot(self)
            scale = 1.0;                                    % Scale option to change robot plot size
            q = deg2rad([0 0 70 30 80 0]);                  % Starting joint angles (default position for Dobot)
            self.model.plot(q,'noarrow','workspace',self.workspace,'scale',scale)   % Plot the robot in environment
            %self.model.teach;                              % Open teach functionality for testing purposes
            self.model.delay = 0;                           % Set internal delay to 0 to speed up trajectory animation
        end
    end
end