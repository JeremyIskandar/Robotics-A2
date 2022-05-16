%% Robotics visual servoing
function [  ] = dobot_visual_servoing( )

close all
clf

%% 1.1 Definitions


% Create image target (points in the image plane) 
pStar = [662 362 362 662; 362 362 662 662];

%Create 3D points
% P=[1.8,1.8,1.8,1.8;
% -0.25,0.25,0.25,-0.25;
%  1.25,1.25,0.75,0.75];
P=[-0.05,0.05,-0.05,0.05;
-0.35,-0.35,-0.35,-0.35;
 0.2,0.2,0.1,0.1];

dobot = myDobotRail();             

%Initial pose
%q0 = [0;-0.8011;0.8072;1.5062;-0.7226;0];
q0 = deg2rad([0; 0; 70; 30; 80; 0]);

% Add the camera
cam = CentralCamera('focal', 0.08, 'pixel', 10e-5, ...
'resolution', [1024 1024], 'centre', [512 512],'name', 'DoBotcamera');

% frame rate
fps = 25;

%Define values
%gain of the controler
lambda = 0.6;
%depth of the IBVS
depth = mean (P(1,:));

%% 1.2 Initialise Simulation (Display in 3D)

%Display DoBot
Tc0= dobot.model.fkine(q0) * troty(90, 'deg');
dobot.model.animate(q0');
drawnow

% plot camera and points
cam.T = Tc0;
% Display points in 3D and the camera
cam.plot_camera('Tcam',Tc0, 'label','scale',0.05);
plot_sphere(P, 0.01, 'g')
lighting gouraud
light

%% 1.3 Initialise Simulation (Display in Image view)

%Project points to the image
p = cam.plot(P, 'Tcam', Tc0);

%camera view and plotting
cam.clf()
cam.plot(pStar, '*'); % create the camera view
cam.hold(true);
cam.plot(P, 'Tcam', Tc0, 'o'); % create the camera view
pause(2)
cam.hold(true);
cam.plot(P);    % show initial view


%Initialise display arrays
vel_p = [];
uv_p = [];
history = [];

%% 1.4 Loop
% loop of the visual servoing
ksteps = 0;
 while true
        ksteps = ksteps + 1;
        
        % compute the view of the camera
        uv = cam.plot(P);
        
        % compute image plane error as a column
        e = pStar-uv;   % feature error
        e = e(:);
        Zest = [];
        
        % compute the Jacobian
        if isempty(depth)
            % exact depth from simulation (not possible in practice)
            pt = homtrans(inv(Tcam), P);
            J = cam.visjac_p(uv, pt(3,:) );
        elseif ~isempty(Zest)
            J = cam.visjac_p(uv, Zest);
        else
            J = cam.visjac_p(uv, depth );
        end

        % compute the velocity of camera in camera frame
        try
            v = lambda * pinv(J) * e;
        catch
            status = -1;
            return
        end
        fprintf('v: %.3f %.3f %.3f %.3f %.3f %.3f\n', v);

        %compute robot's Jacobian and inverse
        J2 = dobot.model.jacobn(q0);
        Jinv = pinv(J2);
        % get joint velocities
        qp = Jinv*v;

         
         %Maximum angular velocity cannot exceed 180 degrees/s
         ind=find(qp>pi);
         if ~isempty(ind)
             qp(ind)=pi;
         end
         ind=find(qp<-pi);
         if ~isempty(ind)
             qp(ind)=-pi;
         end

        %Update joints 
        q = q0 + (1/fps)*qp;
        dobot.model.animate(q');

        %Get camera location
        Tc = dobot.model.fkine(q);
        cam.T = Tc;

        drawnow
        
        % update the history variables
        hist.uv = uv(:);
        vel = v;
        hist.vel = vel;
        hist.e = e;
        hist.en = norm(e);
        hist.jcond = cond(J);
        hist.Tcam = Tc;
        hist.vel_p = vel;
        hist.uv_p = uv;
        hist.qp = qp;
        hist.q = q;

        history = [history hist];

         pause(1/fps)

        if ~isempty(200) && (ksteps > 200)
            break;
        end
        
        %update current joint position
        q0 = q;
 end %loop finishes

end