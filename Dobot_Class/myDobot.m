% Dobot Magician Specs: https://www.dobot.cc/dobot-magician/specification.html

classdef myDobot < handle
    properties
        model;
        workspace = [-0.5 0.5 -0.5 0.5 0 0.5];  % define the boundaries of the workspace 
    end

    methods
        function self = myDobot()
            self.GetDobot();    %calls GetDobot function
            self.PlotDobot();   %calls PlotDobot function
        end

        function GetDobot(self)
            pause(0.001);

            L1 = Link('d',0.103,'a',0,     'alpha',pi/2, 'qlim',[-pi/2       pi/2]);
            L2 = Link('d',0,    'a',0.135, 'alpha',0,    'qlim',[5*pi/180    pi/2]);
            L3 = Link('d',0,    'a',0.147, 'alpha',0,    'qlim',[-pi/2 10*pi/180]);     % these limits are not quite right based on images of dobot
            L4 = Link('d',0,    'a',0.0385,'alpha',-pi/2,'qlim',[-pi/2       pi/2]);    % 0.0385 calculated using pythag and known angles/distances

            self.model = SerialLink([L1 L2 L3 L4],'name','myDobot');
            self.model.base = self.model.base * transl(0,0,0.08);  % set base location of robot (adjusted to suit envinronment)
        end

        function PlotDobot(self)
            scale = 0.8;    % scale the robot down
            q = zeros(1,4); % generate a vector of joint angles         
            self.model.plot(q,'workspace',self.workspace,'scale',scale) % plot the robot
            self.model.teach;
            self.model.delay = 0;   % set delay to 0 to speed up animation in trajectory
        end
    end
end

%% For use in main script
% q = dobot.getpos();     % Get the joint angles at the current position        
% J = dobot.jacob0(q);