function y = CalCalc(h,w)

connector on yourpassword;

% My computer's DNS name and IP address are displayed on
% the MATLAB Command Window, along with a test link. Click on the test link
% to ensure that your desktop is ready to connect. The last digits after
% the colon on the test link correspond to the port that has been opened.

% Used the 'mobiledev' command to create an object that represents mobile device.

m = mobiledev
% Data acquisition starts:
% Enable the acceleration sensor on the device.

m.AccelerationSensorEnabled = 1;

m.Logging = 1;


pause(1)
% Recursive Loop

    % 'accellog' retrieves XYZ acceleration data time values


    [a, t] = accellog(m);
    
    %x = a(:,1);
    y = a(:,2);  %We will use accelerometer only along the y-orientation
    %z = a(:,3);
    
    y=abs(y);
    
    % cumtrapz(x,y) finds the integral of the function
    %Using cumtrapz() to find integral of acceleration i.e velocity
    
    velocity = cumtrapz(t,y);
    
        
    %calories burned relation with respect to height,weight and velocity
    cals = ((0.035*w)+((velocity / h)*0.029*w)); 
    
    plot(t, cals);
    xlabel('Time (s)');
    ylabel('Calories burned per minute at this rate (cal/min)');
    pause(1);
    
    flag=0;
    
    if flag==0
        CalCalc(h,w);
        


% Stop acquiring data

m.Logging = 0;

% Storing logged data


% Plotting sensor data
% The logged acceleration data for all three axes can be plotted together.



% Turn off the acceleration sensor and clear |mobiledev|.

m.AccelerationSensorEnabled = 0;
clear m;
end

