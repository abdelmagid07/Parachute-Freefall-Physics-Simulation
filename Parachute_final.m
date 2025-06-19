% Abdel A.
% Parachute Task 4
% Simulates a skydiver's fall and parachute deployment using variable air density and air resistance.

clear all
close all
clc

%% Initial Conditions
g = -9.8;            % Acceleration due to gravity (m/s^2)
alt(1) = 4000;       % Starting altitude (m)
timer(1) = 0;        % Initial time (s)
timestep = 0.1;      % Time interval (s)
vel(1) = 0;          % Initial vertical velocity (m/s)
acc(1) = 0;          % Initial acceleration (m/s^2)
td(1) = 0;           % Time since parachute deployed (s)

%% Air Density Function 
function density = airden(alt)
    if alt > 3658
        den1 = 0.839; den2 = 0.894; alt1 = 4267; alt2 = 3658;
    elseif alt > 3048
        den1 = 0.894; den2 = 0.952; alt1 = 3658; alt2 = 3048;
    elseif alt > 2438
        den1 = 0.952; den2 = 1.014; alt1 = 3048; alt2 = 2438;
    elseif alt > 1829
        den1 = 1.014; den2 = 1.078; alt1 = 2438; alt2 = 1829;
    elseif alt > 1219
        den1 = 1.078; den2 = 1.146; alt1 = 1829; alt2 = 1219;
    elseif alt > 610
        den1 = 1.146; den2 = 1.216; alt1 = 1219; alt2 = 610;
    else
        den1 = 1.216; den2 = 1.290; alt1 = 610; alt2 = 0;
    end
    density = den2 - (den2 - den1) / (alt2 - alt1) * (alt2 - alt);
end

%% Stage 1 - Free Fall Drag Function
function aAir = dragFF(v, alt)
    Cd = 1;
    A = 0.5;      % Cross-sectional area (m²)
    m = 80;       % Mass (kg)
    rho = airden(alt);
    aAir = 0.5 * rho * Cd * A * v^2 / m;
end

%% Stage 2 - Parachute Open Drag Function
function aAir = dragP(v, td, alt)
    Cd = 1;
    Ao = 3.6;     % Parachute area (m²)
    m = 80;
    rho = airden(alt);
    if td < 3.21
        A = pi * (-2 * 3 * (Ao - 0.5) / (3.2^2) / 3 / 3.2 * td^3 + ...
                  3 * (Ao - 0.5) / (3.2^2) * td^2 + 0.5)^2;
    else
        A = pi * Ao^2;
    end
    aAir = 0.5 * rho * Cd * A * v^2 / m;
end

%% Simulation Loop
i = 1;
while alt(i) > 0
    if timer(i) < 60  % Free fall stage
        aAir = dragFF(vel(i), alt(i));
    else              % Parachute stage
        aAir = dragP(vel(i), timer(i) - 60, alt(i));
    end
    
    acc(i+1) = aAir + g;  % Net acceleration
    vel(i+1) = vel(i) + acc(i+1) * timestep;
    alt(i+1) = alt(i) + vel(i) * timestep + 0.5 * acc(i+1) * timestep^2;
    timer(i+1) = timer(i) + timestep;
    
    i = i + 1;
end

%% Max G-Force Calculation
max_gforce = max(acc) / 9.8;
fprintf('The maximum g-force experienced by the diver is %.1f G\n', max_gforce);

%% Plotting

% Subplot 1: Altitude vs Time
subplot(3,1,1);
plot(timer, alt);
title('Altitude, Velocity, and Acceleration of a Skydive Jump');
ylabel('Altitude (m)');

% Subplot 2: Velocity vs Time
subplot(3,1,2);
plot(timer, vel);
ylabel('Vertical Velocity (m/s)');

% Subplot 3: Acceleration vs Time
subplot(3,1,3);
plot(timer, acc);
ylabel('Acceleration (m/s^2)');
xlabel('Time (s)');

% Zoomed Plot: Acceleration during terminal velocity
figure(2)
plot(timer(200:600), acc(200:600));
title('Acceleration of Skydiver (20s–60s)');
xlabel('Time (s)');
ylabel('Vertical Acceleration (m/s^2)');

