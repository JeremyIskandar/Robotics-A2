clear all 
close all 

myEnv;      

dobot = myDobotRail();


%%



collisionObject = input("Enter 1 for Collision Objects & 0 for no objects  ");
if collisionObject == 1
centerpnt = [0.16,0.2,0.1];
side = 0.1;
plotOptions.plotFaces = true;
[vertex,faces,faceNormals] = RectangularPrism(centerpnt-side/2, centerpnt+side/2,plotOptions);
axis equal
else
end





dobotCurrentEndEfPose = dobot.model.fkine(dobot.model.getpos()); % stores the new End Effector pose after picking up the brick
%dobotCurrentJointAngles = dobot.model.ikcon(dobot.model.getpos());
dobotPotLocation = transl(0.25,0.2,0); % wall location of the picked up brick to go to
dobotFinalIkcon = dobot.model.ikcon(dobotPotLocation,dobot.model.getpos());%, dobot.model.getpos()); %joint angles required to get to new  brick position
dobotTrajOfJointsFinal = jtraj((dobot.model.getpos()),dobotFinalIkcon,50); % trajectory of joints required to reach specified wall positon

collision = false;

if collisionObject == 1
for i = 1:size(dobotTrajOfJointsFinal,1)
dobotJointsFinal = dobotTrajOfJointsFinal(i,:);

 %0.0847    2.3562    0.0873    1.9102    1.0932   -0.7855

 
        if IsCollision(dobot,dobotJointsFinal,faces,vertex,faceNormals)
            display(dobotJointsFinal)
                collision = true;
                display("collision detected");
                    error('Collision detected!!');
                    
                    
                else
                    display('No collision found');
        end



end
else
    display("no objects on the scene");
end 

dobotCurrentEndEfPose = dobot.model.fkine(dobot.model.getpos()); % stores the new End Effector pose after picking up the brick
%dobotCurrentJointAngles = dobot.model.ikcon(dobot.model.getpos());
dobotPotLocation = transl(0.25,0.2,0); % wall location of the picked up brick to go to
dobotFinalIkcon = dobot.model.ikcon(dobotPotLocation,dobot.model.getpos());%, dobot.model.getpos()); %joint angles required to get to new  brick position
dobotTrajOfJointsFinal = jtraj((dobot.model.getpos()),dobotFinalIkcon,50); % trajectory of joints required to reach specified wall positon

for trajIterateFinal = 1:size(dobotTrajOfJointsFinal,1)
                       

           dobotJointsFinal = dobotTrajOfJointsFinal(trajIterateFinal,:)  

           dobot.model.animate(dobotJointsFinal);
end










%%

% if collision == true
%     display('collision = to true');
%     pause(5);
%     display('avoiding collision going back to home');
%      avoidCollision( ur3, (ur3TrajOfJoints(end,:)), ur3TrajOfJointsFinal(end,:),faces,vertex,faceNormals);
% else
%     display('no collision detected - completing usual trajectory');
% end

%water_plant_2(dobot, 1);

%% Collision Functions
function result = IsCollision(robot,qMatrix,faces,vertex,faceNormals,returnOnceFound)
if nargin < 6
    returnOnceFound = true;
end
result = false;

for qIndex = 1:size(qMatrix,1)
    % Get the transform of every joint (i.e. start and end of every link)
    q = qMatrix(qIndex,:);
%     display("displaying qMatrix");
%     display(qMatrix);
    tr = GetLinkPoses(qMatrix(qIndex,:), robot);
    
    size(tr,3)-1
    size(faces,1)
    % Go through each link and also each triangle face
    for i = 1 : size(tr,3)-1    
        for faceIndex = 1:size(faces,1)
            vertOnPlane = vertex(faces(faceIndex,1)',:);
            display("line plane intersection");
            [intersectP,check] = LinePlaneIntersection(faceNormals(faceIndex,:),vertOnPlane,tr(1:3,4,i)',tr(1:3,4,i+1)')
            display("intersect triangle");
            IsIntersectionPointInsideTriangle(intersectP,vertex(faces(faceIndex,:)',:))
            if check == 1 %&& IsIntersectionPointInsideTriangle(intersectP,vertex(faces(faceIndex,:)',:))
                plot3(intersectP(1),intersectP(2),intersectP(3),'g*');
                display('Intersection');
                result = true;   
                if returnOnceFound
                    return
                end
            end
        end    
    end
end
end

%% GetLinkPoses
% q - robot joint angles
% robot -  seriallink robot model
% transforms - list of transforms
function [ transforms ] = GetLinkPoses( q, robot)
display("robot links");
links = robot.model.links
transforms = zeros(4, 4, length(links) + 1);
transforms(:,:,1) = robot.model.base;

for i = 1:length(links)
    L = links(1,i);
    current_transform = transforms(:,:, i);

    current_transform = current_transform * trotz(q(1,i) + L.offset) * ...
    transl(0,0, L.d) * transl(L.a,0,0) * trotx(L.alpha);
    transforms(:,:,i + 1) = current_transform;
end
end
%%
% function removeBlock(collision)
% display('inside removeBlock');
% 
% if collision == 1
%     display('inside if');
%     centerpnt = [-0.3,0.3,0.2];
%     side = 0.3;
%     plotOptions.plotFaces = true;
%     [vertex,faces,faceNormals] = RectangularPrism(centerpnt-side/2, centerpnt+side/2,plotOptions);
%     colour = true;
%     axis equal
%     camlight
% 
%     
% elseif collision == 0
%     display('inside else');
%      centerpnt = [1,0.4,0.2];
%     side = 0.3;
%     plotOptions.plotFaces = true;
%     [vertex,faces,faceNormals] = RectangularPrism(centerpnt-side/2, centerpnt+side/2,plotOptions);
%     
%     axis equal
%        camlight
%     
%    
% 
% end
% end
%%

function avoidCollision (robot,q1, q2,faces,vertex,faceNormals)
robot.model.animate(q1);

qq_1 = [1.9453,-2.8080,-0.3016,1.8986,-1.6616,3.1416];

qq_2 = [2.5736,-2.8080,-0.3016,1.8986,-1.6616,3.1416];
qq_3 = [2.6365,-2.3053,-0.4273,1.7729,-1.6616,3.1416];

qq_4 = [2.6365,-1.4885,-0.4273,1.7729,-1.6616,3.1416];

qq_5 = [2.6365,-0.6717,-0.4273,1.7729,-1.6616,3.1416];

qq_6 = [2.6354,-0.6091,-0.4276,2.9671,-1.6616,3.1416]

qq_7 = [2.6354,-0.5463,-0.1134,3.0159,-1.5987,3.1416]

 qq_8 = [2.6354,-0.5463,0.4520,3.0159,-1.5987,3.1416]

qq_9 = [2.9496,-0.4835,0.4520,3.0159,-1.5987,3.1416]
qq_10 = [2.9496,-0.4835,0.7662,-1.9478,-1.5359,3.1416]

%qq_5 = 151,-38.5,-24.5,101.6,-95.2,180


qWaypoints = [q1;qq_1;qq_2;qq_3;qq_4;qq_5;qq_6;qq_7;qq_8;qq_9;qq_10;q2];
isCollision = true;
checkedTillWaypoint = 1;
qMatrix = [];
while (isCollision)
    startWaypoint = checkedTillWaypoint;
    for i = startWaypoint:size(qWaypoints,1)-1
        qMatrixJoin = InterpolateWaypointRadians(qWaypoints(i:i+1,:),deg2rad(10));
        if ~IsCollision(robot,qMatrixJoin,faces,vertex,faceNormals)
            qMatrix = [qMatrix; qMatrixJoin]; %#ok<AGROW>
            robot.model.animate(qMatrixJoin);
            size(qMatrix)
            isCollision = false;
            checkedTillWaypoint = i+1;
            % Now try and join to the final goal (q2)
            qMatrixJoin = InterpolateWaypointRadians([qMatrix(end,:); q2],deg2rad(10));
        end
    end
end
end

%             if ~IsCollision(robot,qMatrixJoin,faces,vertex,faceNormals)
%                 qMatrix = [qMatrix;qMatrixJoin];
%                 % Reached goal without collision, so break out
%                 break;
%             end
%         else
%             % Randomly pick a pose that is not in collision
%             qRand = (2 * rand(1,6) - 1) * pi;
%             while IsCollision(robot,qRand,faces,vertex,faceNormals)
%                 qRand = (2 * rand(1,6) - 1) * pi;
%             end
%             qWaypoints =[ qWaypoints(1:i,:); qRand; qWaypoints(i+1:end,:)];
%             isCollision = true;
%             break;
%         end
%     end
% end
% robot.animate(qMatrix)
%% InterpolateWaypointRadians
% Given a set of waypoints, finely intepolate them
function qMatrix = InterpolateWaypointRadians(waypointRadians,maxStepRadians)
if nargin < 2
    maxStepRadians = deg2rad(1);
end

qMatrix = [];
for i = 1: size(waypointRadians,1)-1
    qMatrix = [qMatrix ; FineInterpolation(waypointRadians(i,:),waypointRadians(i+1,:),maxStepRadians)]; %#ok<AGROW>
end
end

%% FineInterpolation
% Use results from Q2.6 to keep calling jtraj until all step sizes are
% smaller than a given max steps size
function qMatrix = FineInterpolation(q1,q2,maxStepRadians)
if nargin < 3
    maxStepRadians = deg2rad(1);
end
    
steps = 2;
while ~isempty(find(maxStepRadians < abs(diff(jtraj(q1,q2,steps))),1))
    steps = steps + 1;
end
qMatrix = jtraj(q1,q2,steps);
end






