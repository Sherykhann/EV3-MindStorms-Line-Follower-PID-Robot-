 myev3=legoev3('usb');
 mycolorsensor = colorSensor(myev3); %Connection to a color sensor
 mymotor1 = motor(myev3,'A')
 mymotor2 = motor(myev3,'D')
     color = readColor(mycolorsensor);
 readLightIntensity(mycolorsensor);
 intensity = readLightIntensity(mycolorsensor,'reflected')

 ref=45;
 %PID Control Parameters 
  Kp=1.75
  Tp=40;
  lastError=0
                                                                                                                                    1111`b

 while(1) 
     Lightvalue = readLightIntensity(colorSensor,'reflected');
     error = ref - Lightvalue; 
     controller_output=error*Kp 
     mymotor1.Speed= Tp + controller_output;
     mymotor2.Speed= Tp - controller_output;
     start(mymotor1);
     start(mymotor2);
     lastError= error;        
 end     
 %stop(mymotor1);
 %stop(mymotor2);

 
    

