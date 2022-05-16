%% Movement 1
q0 = dobot.model.getpos();          %Get the joint angles at the current position
tr1 = transl([0.3 0.3 0.1]);        %Define the next end-effector pose
qr1 = dobot.model.ikcon(tr1);       %Solve the inverse kinematics to get the required joint angles

steps = 50;

qMatrix_1 = jtraj(q0,qr1,steps);    %move from default to pos1
for i = 1:steps
    dobot.model.animate(qMatrix_1(i,:));
    dobot.model.fkine(qMatrix_1(i,:));
    drawnow();
    pause(0.001);
end

%% Movement 2
q0 = dobot.model.getpos();          %Get the joint angles at the current position
tr1 = transl([-0.4 -0.4 0.1]);              %Define the next end-effector pose
qr1 = dobot.model.ikcon(tr1);       %Solve the inverse kinematics to get the required joint angles

steps = 50;

qMatrix_1 = jtraj(q0,qr1,steps);    %move from default to pos1
for i = 1:steps
    dobot.model.animate(qMatrix_1(i,:));
    dobot.model.fkine(qMatrix_1(i,:));
    drawnow();
    pause(0.001);
end

%% Movement 3
q0 = dobot.model.getpos();          %Get the joint angles at the current position
tr1 = transl([-0.3 -0.3 0.2]);              %Define the next end-effector pose
qr1 = dobot.model.ikcon(tr1);       %Solve the inverse kinematics to get the required joint angles

steps = 50;

qMatrix_1 = jtraj(q0,qr1,steps);    %move from default to pos1
for i = 1:steps
    dobot.model.animate(qMatrix_1(i,:));
    dobot.model.fkine(qMatrix_1(i,:));
    drawnow();
    pause(0.001);
end

%% Movement 4
q0 = dobot.model.getpos();          %Get the joint angles at the current position
tr1 = transl([0.2 -0.1 0.15]);              %Define the next end-effector pose
qr1 = dobot.model.ikcon(tr1);       %Solve the inverse kinematics to get the required joint angles

steps = 50;

qMatrix_1 = jtraj(q0,qr1,steps);    %move from default to pos1
for i = 1:steps
    dobot.model.animate(qMatrix_1(i,:));
    dobot.model.fkine(qMatrix_1(i,:));
    drawnow();
    pause(0.001);
end

%% Movement 5
q0 = dobot.model.getpos();          %Get the joint angles at the current position
tr1 = transl([-0.2 0.3 0.22]);              %Define the next end-effector pose
qr1 = dobot.model.ikcon(tr1);       %Solve the inverse kinematics to get the required joint angles

steps = 50;

qMatrix_1 = jtraj(q0,qr1,steps);    %move from default to pos1
for i = 1:steps
    dobot.model.animate(qMatrix_1(i,:));
    dobot.model.fkine(qMatrix_1(i,:));
    drawnow();
    pause(0.001);
end

%% Movement 6
q0 = dobot.model.getpos();          %Get the joint angles at the current position
tr1 = transl([0.3 -0.4 0.13]);              %Define the next end-effector pose
qr1 = dobot.model.ikcon(tr1);       %Solve the inverse kinematics to get the required joint angles

steps = 50;

qMatrix_1 = jtraj(q0,qr1,steps);    %move from default to pos1
for i = 1:steps
    dobot.model.animate(qMatrix_1(i,:));
    dobot.model.fkine(qMatrix_1(i,:));
    drawnow();
    pause(0.001);
end

%% Movement 7
q0 = dobot.model.getpos();          %Get the joint angles at the current position
tr1 = transl([0.4 0.3 0.18]);              %Define the next end-effector pose
qr1 = dobot.model.ikcon(tr1);       %Solve the inverse kinematics to get the required joint angles

steps = 50;

qMatrix_1 = jtraj(q0,qr1,steps);    %move from default to pos1
for i = 1:steps
    dobot.model.animate(qMatrix_1(i,:));
    dobot.model.fkine(qMatrix_1(i,:));
    drawnow();
    pause(0.001);
end