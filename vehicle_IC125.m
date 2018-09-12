% CLASS HST
Davis=[6 0.21 0.01453 0].*(404/752.4)
Mass=404   *1.15        %752.4
lambda=0.08;
inertial_mass=Mass*(1+lambda);
Power=2640*1000
max_speed=200
seats=600

%MAXIMUM TRACTION FORCE
co_fric=0.20
gravity=9.81
driving_wheel_Po=(70)*2 
max_traction=Mass * 1000 * 9.81 * co_fric * (driving_wheel_Po/Mass)/1000
max_traction=170

%MAXIMUM ACCELERATION
max_accel=[max_traction/Mass]

%STATION DWELL TIME
dwell=120

%STATION TERMINAL TIME (Seconds)
Terminal_time=50*60;

%proportional k
kd=0.5;

%notch numbers
notch_num=5;

%train control
%1 = fast as possible
%2 = proportional
%3 = proportional and notched
train_control=1;

