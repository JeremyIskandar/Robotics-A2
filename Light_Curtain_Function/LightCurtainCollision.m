function [collision_point] = LightCurtainCollision(light_curtain_points,sphere_points)

%Check if any points are equal to one another, meaning they collide

hold on
flag = 0;

%if points are equal:
% for lc = 1:length(light_curtain_points)
%     lc_x = light_curtain_points(lc,1);
%     lc_y = light_curtain_points(lc,2);
%     lc_z = light_curtain_points(lc,3);
%     
%     for sph = 1:length(sphere_points)
%         sph_x = sphere_points(sph,1);
%         sph_y = sphere_points(sph,2);
%         sph_z = sphere_points(sph,3);
% 
%         sph_x_r = round(sph_x*1000)/1000;
%         sph_y_r = round(sph_y*1000)/1000;
%         sph_z_r = round(sph_z*1000)/1000;
% 
%         if (lc_x == sph_x_r) && (flag == 0)
%             if (lc_y == sph_y_r)
%                 if (lc_z == sph_z_r)
%                     flag = 1;
%                     collision_point = [sph_x,sph_y,sph_z];
%                     plot3(sph_x,sph_y,sph_z,'o','Color','r','MarkerSize',10,'LineWidth',2);
%                 end
%             end
%         end
%     end
% end

%if points are close (tolerance):
% tolerance = 0.02;
% for lc = 1:length(light_curtain_points)
%     for sph = 1:length(sphere_points)
%         lc_x = light_curtain_points(lc,1);
%         sph_x = sphere_points(sph,1);
%         lc_y = light_curtain_points(lc,2);
%         sph_y = sphere_points(sph,2);
%         lc_z = light_curtain_points(lc,3);
%         sph_z = sphere_points(sph,3);
% 
%         if ((abs(lc_x) - abs(sph_x)) < tolerance) && (flag == 0)
%             if (abs(lc_y) - abs(sph_y)) < tolerance
%                 if (abs(lc_z) - abs(sph_z)) < tolerance
%                     flag = 1;
%                     collision_point = [lc_x,lc_y,lc_z];
%                     plot3(lc_x,lc_y,lc_z,'o','Color','r','MarkerSize',10,'LineWidth',2);
%                 end
%             end
%         end
%     end
% end

%if points are close and rounded to 2dp
% tolerance = 0.1;
% for lc = 1:length(light_curtain_points)
%     lc_x = light_curtain_points(lc,1);
%     lc_y = light_curtain_points(lc,2);
%     lc_z = light_curtain_points(lc,3);
%     
%     for sph = 1:length(sphere_points)
%         sph_x = sphere_points(sph,1);
%         sph_y = sphere_points(sph,2);
%         sph_z = sphere_points(sph,3);
% 
%         sph_x_r = round(sph_x*100)/100;
%         sph_y_r = round(sph_y*100)/100;
%         sph_z_r = round(sph_z*100)/100;
% 
%         if ((abs(lc_x) - abs(sph_x_r)) < tolerance) && (flag == 0)
%             if (abs(lc_y) - abs(sph_y_r)) < tolerance
%                 if (abs(lc_z) - abs(sph_z_r)) < tolerance
%                     flag = 1;
%                     collision_point = [lc_x,lc_y,lc_z];
%                     plot3(lc_x,lc_y,lc_z,'o','Color','r','MarkerSize',10,'LineWidth',2);
%                 end
%             end
%         end
%     end
% end

%new test with distance
tolerance = 0.02;
for lc = 1:length(light_curtain_points)
    lc_x = light_curtain_points(lc,1);
    lc_y = light_curtain_points(lc,2);
    lc_z = light_curtain_points(lc,3);
    
    for sph = 1:length(sphere_points)
        sph_x = sphere_points(sph,1);
        sph_y = sphere_points(sph,2);
        sph_z = sphere_points(sph,3);
        dist_xz = sqrt((sph_x-lc_x)^2+(sph_z-lc_z)^2);
        dist_xy = sqrt((sph_x-lc_x)^2+(sph_y-lc_y)^2);

        if (dist_xz < tolerance) && (dist_xy < tolerance) && (flag == 0)
            flag = 1;
            lc_collision_point = [lc_x,lc_y,lc_z];
            %sph_collision_point = [sph_x,sph_y,sph_z]; %not needed
            plot3(lc_x,lc_y,lc_z,'o','Color','r','MarkerSize',10,'LineWidth',2);
        end
    end
end

if flag == 0
    disp("--> Flag not tripped - no collision");
    collision_point = 0;
end

if flag == 1
    collision_point = lc_collision_point;
    disp("--> Flag tripped - collision detected at:");
    disp(collision_point);
    
end

end

