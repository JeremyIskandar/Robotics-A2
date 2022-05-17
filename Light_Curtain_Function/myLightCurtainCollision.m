function [collision_point] = myLightCurtainCollision(light_curtain_points,sphere_points)

    % This function checks if any points of the light curtain and sphere are extremely close to one another, meaning they collide

    hold on                                     % Plot any collision points in same figure
    flag = 0;                                   % Set initial flag to zero (flag will be tripped if collision detected)

    % These loops test the distance between each point on the light curtain and sphere:
    tolerance = 0.02;                                           % Set distance tolerance to 0.02
    for lc = 1:length(light_curtain_points)
        lc_x = light_curtain_points(lc,1);
        lc_y = light_curtain_points(lc,2);
        lc_z = light_curtain_points(lc,3);
    
        for sph = 1:length(sphere_points)
            sph_x = sphere_points(sph,1);
            sph_y = sphere_points(sph,2);
            sph_z = sphere_points(sph,3);
            dist_xz = sqrt((sph_x-lc_x)^2+(sph_z-lc_z)^2);      % Calculate the distance between x and z points
            dist_xy = sqrt((sph_x-lc_x)^2+(sph_y-lc_y)^2);      % Calculate the distance between x and y points

            if (dist_xz < tolerance) && (dist_xy < tolerance) && (flag == 0)
                flag = 1;                                       % If both these distances are less than the tolerance, trip the flag
                lc_collision_point = [lc_x,lc_y,lc_z];          % Save the collision point for later
                plot3(lc_x,lc_y,lc_z,'o','Color','r','MarkerSize',10,'LineWidth',2);    % Plot the collision point in red in the environment
            end
        end
    end

    if flag == 0                                                % If the flag was not tripped...
        disp("--> Flag not tripped - no collision");            % Display to user in command window
        collision_point = 0;                                    % Return 0 to main
    end

    if flag == 1
        collision_point = lc_collision_point;                   % If the flag was tripped...
        disp("--> Flag tripped - collision detected at:");      % Display collision point to user in command window
        disp(collision_point);
    end
end

%% Previous testing methods, for reference:
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

