function [  ] = myVisualServoing(dobot)

    % This function initialises visual servoing feature for the dobot

    % Create image target (points in the image plane) 
%     pStar = [800 300 300+100 800-100 550; 300 300 800-200 800-200 50];             % STARTS AT TOP RIGHT ANTICLOCKWISE UNTIL LAST POINT BOTTOM RIGHT
    pStar = [600 400 440 560 500; 500 500 620 620 400]; 
      dobot = myDobotRail();

    % Create 3D points:
    % P=[1.8,1.8,1.8,1.8;
    % -0.25,0.25,0.25,-0.25;
    %  1.25,1.25,0.75,0.75];
    P=[0.15,0.15,0.25-0.04,0.25-0.04,0.1;
    -0.28,-0.18,-0.18-0.02,-0.28+0.02,-0.23;
    0.45, 0.45,0.45,0.45,0.45];                                 % STARTS AT TOP RIGHT ANTICLOCKWISE UNTIL LAST POINT BOTTOM RIGHT        
    
    % Initial pose:
    %q0 = [0;-0.8011;0.8072;1.5062;-0.7226;0];
    q0 = [0.1924;-0.0001;1.2979;1.7141;0.1298;0.0001];
%   q0 = deg2rad([rad2deg(0.2); 0; 70; 30; 80; 0]);   % WORKING ORIGINAL

    % Add the camera:
    cam = CentralCamera('focal', 0.08, 'pixel', 10e-5, ...
    'resolution', [1024 1024], 'centre', [512 512],'name', 'DoBotcamera');
    fps = 25;               % Frame rate

    % Define values:
    lambda = 30;            % Gain of the controler
    depth = mean(P(1,:));   % Depth of the IBVS
    epsilon = 0.02;

    % Display DoBot:
    Tc0= dobot.model.fkine(q0);
    dobot.model.animate(q0');
    drawnow

    % Plot camera and points
    cam.T = Tc0;

    % Display points in 3D and the camera:
    cam.plot_camera('Tcam',Tc0, 'label','scale',0.05);
    plot_sphere(P, 0.01, 'g')
    hold on
    
    pentagon_safety = PlaceObject('PentagonExtruded_2.ply',[0.16,0.23-0.45,0.45]);
    
    lighting gouraud
    light

    % Project points to the image:
    p = cam.plot(P, 'Tcam', Tc0);

    % Camera view and plotting:
    cam.clf();                          % Plot figure of desired pose camera model
    
    cam.plot(pStar, '*');               % Create the camera view
    cam.hold(true);
    cam.plot(P, 'Tcam', Tc0, 'o');      % Create the camera view
    pause(2)
    cam.hold(true);
    cam.plot(P);                        % Show initial view
    input('Press ENTER once figure has been setup');
    % Initialise display arrays:
    vel_p = [];
    uv_p = [];
    history = [];

    % Loop of the visual servoing:
    ksteps = 0;
    while true
        ksteps = ksteps + 1;
        uv = cam.plot(P);                       % Compute the view of the camera
        
        % Compute image plane error as a column:
        e = pStar-uv;                           % feature error
        e = e(:);
        Zest = [];
        
        % Compute the Jacobian:
        if isempty(depth)
            % Exact depth from simulation (not possible in practice):
            pt = homtrans(inv(Tcam), P);
            J = cam.visjac_p(uv, pt(3,:) );
        elseif ~isempty(Zest)
            J = cam.visjac_p(uv, Zest);
        else
            J = cam.visjac_p(uv, depth );
        end %%%was this meant to be commented??

        % Compute the velocity of camera in camera frame:
        try
            v = lambda * pinv(J) * e;
        catch
            status = -1;
        return
        end
        fprintf('v: %.3f %.3f %.3f %.3f %.3f %.3f\n', v);
        BIIIIG = dobot.model.getpos();
        disp(BIIIIG);

%         %compute robot's Jacobian and inverse
%         J2 = dobot.model.jacobn(q0);
%         Jinv = pinv(J2);
%         % get joint velocities
%         qp = Jinv*v;

        % Compute the Jacobian:
        J = cam.visjac_p(uv, depth );
 
        % Compute the velocity of camera in camera frame:
        try
            v = lambda * pinv(J) * e;
        catch
            status = -1;
        return
        end
         
        % Compute robot's Jacobian and inverse:
        J2 = dobot.model.jacobn(q0);                    % Get Jacobian at current joint state (jacobn = local ee frame, jacob0 = world frame)
        m(ksteps) = sqrt(det(J2*J2'));                  % Computing measure of manipulability
         
        if m(ksteps) < epsilon                          % If manipulability is less than given threshold
            damping = (1 - m(ksteps)/epsilon)*5E-1;     % Damped least square
        else
            damping = 0;
        end

        Jinv = inv(J2'*J2 + damping*eye(6))*J2';
        qp = Jinv*v;

        % Maximum angular velocity cannot exceed 180 degrees/s:
        ind=find(qp>pi);
        if ~isempty(ind)
            qp(ind)=pi;
        end

        ind=find(qp<-pi);
        if ~isempty(ind)
            qp(ind)=-pi;
        end

        % Update joints:
        q = q0 + (1/fps)*qp;
        dobot.model.animate(q');

        % Get camera location:
        Tc = dobot.model.fkine(q);
        cam.T = Tc;
        drawnow
        
        % Update the history variables:
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
        BIIIIG = dobot.model.getpos();
        disp(BIIIIG);
        pause(1/fps)

        if ~isempty(250) && (ksteps > 150)
            BIIIIG = dobot.model.getpos();
            disp(BIIIIG);   
            input('Press ENTER when done')
            break;
        end
        
        q0 = q;             % Update current joint position
    end
    
end