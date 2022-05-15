# Example of how to implement light curtain from main:

```
%% light curtain testing

clear
clc

myEnv;
myDobotRail;
myLightCurtain;

sphere_points = mySphere(0,-1.7,0.55);
collision_point = LightCurtainCollision(light_curtain_points,sphere_points);

```

## Returns:
* "--> Flag not tripped - no collision"

or

* "--> Flag tripped - collision detected at:"
* [x,y,z] %collision point
