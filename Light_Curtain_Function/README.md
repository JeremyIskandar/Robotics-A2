# Light_Curtain_Function

## myLightCurtainDemo
* This sctipt opens the environment `myEnv` and robot `myDobotRail`
* Calls `myLightCurtain` to create the light curtain
* Rest of the script waters plant 1, then plant 2, moving the robot and cube using the `dobot_move_lc` function

## myLightCurtain
* This script creates the actual light curtain in the gap between the fences to the workspace as a `surf` built from a `meshgrid` of points
* The matrix `light_curtain_points` contains all [x,y,z] points within the light curtain plane
* 
## dobot_move_lc
* This function starts moving the robot and starts moving the box incrementally closer to the light curtain
* The function `myLightCurtainCollision` is called during each step of the trajectory to check if a collision occurs
* If that function trips the flag `lc_flag`, a collision has been detected and the trajectory stops
* The trajectory can resume once the user responds to the `input` by pressing ENTER
* The cube is deleted from the workspace and the robot continues watering plant 1, then plant 2 for demonstration

## myLightCurtainCollision
* This function checks each point of the light curtain against each point of the box
* If any of the points fall within the defined `tolerance` (in this case, 0.05), then a collision is assumed and the flag `lc_flag` is tripped
* A tolerance was used against comparing the exact values, because points often had multiple decimal places and wouldn't exactly equal each other
