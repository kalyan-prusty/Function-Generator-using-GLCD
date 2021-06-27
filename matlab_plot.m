close all; clear all;

TIME_GAP = 0.01;
WINDOW_SIZE = 1000;
% serial object
s = serial('COM5','BaudRate',115200);
% open serial port
fopen(s)

% Plotting data
i = 1;
j = 1;
while(1)  
	%tic - toc is just to see the time to caapture 
   tic
    data1 =  fscanf(s); %capture what you are reciving in UART
   toc
   
   newStr = split(data1,',');% split the data separated by ","
 
   if(strcmp(newStr(1),'1'))% if the 1st charecter is 1 then plot in channel 1
   
   data2(i) = single(str2double(newStr(2)));
   
   time2(i) = i;
       
      if i <= WINDOW_SIZE
       subplot(3,1,1);
        %tic
            plot(data2,'Linewidth',1.5);
       %toc
      else
       subplot(3,1,1);
       plot(time2(end-WINDOW_SIZE:end),data2(end-WINDOW_SIZE:end),'Linewidth',1.5)
      end
      
     pause(TIME_GAP);

     i = i+1;
     
   elseif (strcmp(newStr(1),'2')) % if the 1st charecter is 2 then plot in channel 2
   
   data3(j) = single(str2double(newStr(2)));
   time3(j) = j;
       
      if j <= WINDOW_SIZE
       subplot(3,1,2);
       plot(data3,'Linewidth',1.5)
      else
       subplot(3,1,2);
       plot(time3(end-WINDOW_SIZE:end),data3(end-WINDOW_SIZE:end),'Linewidth',1.5)
      end
      

     pause(TIME_GAP);

     j = j+1;
  
   end  
end
