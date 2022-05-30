# Robot_Movement_Function
These functions initiate movement of the dobot:
* `dobot_move_1` uses fkine to move to a specified end-effector location
* `water_plant_2` enables movement to a specified plant

## Notes
* `fkine` is forward kinematics - provide joint angles
* `ikine` is inverse kinematics - provide end-effector location
* `ikcon` is an optimised version of `ikine`
* RMRC is a more optimal way of calculating the trajectory
* `jtraj` means we used the quintic polynomial method for trajectory
