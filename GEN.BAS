'3D Landscape Generator v1.0 by Cameron Armstrong

resolution=20
angle=2
mode=3
land=1
weather=1
water=1
mountains=1
hour$=mid$(time$,1,2)
minute$=mid$(time$,4,2)
if val(hour$)=0 hour$="00"
if val(minute$)<10 minute$="0"+mid$(time$,4,1)
settime$=hour$+minute$
label main
clear screen
print "3D Landscape Generator v1.0"
print "1. Time"
print "2. Environment"
print "3. Life"
print "4. Settings"
print "5. Create Landscape"
label commandinput
input command
command=int(command)
if command>5 or command<1 then
print "Bad command or file name"
goto commandinput
fi
if command=1 goto timeset
if command=2 goto environment
if command=3 goto life
if command=4 goto settings
if command=5 goto create

label timeset
hour$=mid$(time$,1,2)
minute$=mid$(time$,4,2)
if val(hour$)<10 hour$="0"+mid$(hour$,1,1)
if val(minute$)<10 minute$="0"+mid$(time$,4,1)
realtime$=hour$+minute$
clear screen
print "Time Set"
print "1. Set Time"
print "2. Use Real Current Time"
print "3. Back"
print ""
print "The current real system time is: ",left$(realtime$,2),":",mid$(realtime$,3,2)
print "The current set time is: ",left$(settime$,2),":",mid$(settime$,3,2)
input command
command=int(command)
if command>3 or command<1 then
print "Bad command or file name"
goto timeset
fi

if command=1 then
clear screen
print "Set hour (0->23)"
input hour$
if val(hour$)<0 or val(hour$)>23 then
print "Invalid value"
pause 1
goto timeset
fi
print "Set minute (0->59)"
input minute$
if val(minute$)<0 or val(minute$)>59 then
print "Invalid value"
pause 1
goto timeset
fi
if val(hour$)<10 hour$="0"+hour$
if val(minute$)<10 minute$="0"+minute$
settime$=hour$+minute$
goto timeset
fi
if command=2 then
hour$=mid$(time$,1,2)
minute$=mid$(time$,4,2)
if val(hour$)=0 hour$="00"
if val(minute$)<10 minute$="0"+mid$(time$,4,1)
settime$=hour$+minute$
goto timeset
fi
if command=3 goto main

label environment
clear screen
if land=1 land$="Flat"
if land=2 land$="Bumpy"
if land=3 land$="Hilly"
if weather=1 weather$="Clear"
if weather=2 weather$="Cloudy"
if weather=3 weather$="Overcast"
if weather=4 weather$="Rainy"
if weather=5 weather$="Stormy"
if water=1 water$="None"
if water=2 water$="Low"
if water=3 water$="High"
if mountains=1 mountains$="0"
if mountains=2 mountains$="1"
if mountains=3 mountains$="2"
if mountains=4 mountains$="3"
print "1. Land"
print "2. Weather"
print "3. Water"
print "4. Mountains"
print "5. Back"
print ""
print "The land is set to: ",land$
print "The weather is set to: ",weather$
print "The water is set to: ",water$
print "The number of mountains is: ",mountains$
input command
command=int(command)
if command<1 or command>5 then
print "Bad command or file name"
pause 1
goto environment
fi
if command=1 then
land=land+1
if land>3 land=1
fi
if command=2 then
weather=weather+1
if weather>5 weather=1
fi
if command=3 then
water=water+1
if water>3 water=1
fi
if command=4 then
mountains=mountains+1
if mountains>4 mountains=1
fi
if command=5 goto main
goto environment

label life
clear screen
if grass=0 grass$="NO"
if trees=0 trees$="NO"
if grass=1 grass$="YES"
if trees=1 trees$="YES"
print "1. Change Grass"
print "2. Change Trees"
print "3. Back"
print
print "Grass: ",grass$
print "Trees: ",trees$
input command
command=int(command)
if command<1 or command>3 then
print "Bad command or file name"
pause 1
goto life
fi
if command=1 grass=1-grass
if command=2 trees=1-trees
if command=3 goto main
goto life

label settings
clear screen
print "1. Set resolution"
print "2. Set viewing angle"
print "3. Set viewing mode"
print "4. Back"
input command
command=int(command)
if command<1 or command>4 then
print "Bad command or file name"
pause 1
goto settings
fi
if command=1 goto resolutionset
if command=2 goto angleset
if command=3 goto modeset
if command=4 goto main
label resolutionset
clear screen
print "Current resolution is: ",resolution
print "Resolution can not exceed 607"
input resolution
resolution=int(resolution)
if resolution<1 resolution=1
if resolution>607 resolution=607
goto settings
label angleset
clear screen
if angle=1 angle$="Normal"
if angle=2 angle$="Birds-eye"
if angle=3 angle$="Horizontal"
print "1. Change angle"
print "2. Back"
print 
print "The current angle is set to: ",angle$
input command
command=int(command)
if command<1 or command>2 then
print "Bad command or file name"
pause 1
goto angleset
fi
if command=1 then
angle=angle+1
if angle>3 angle=1
goto angleset
fi
if command=2 goto settings
label modeset
clear screen
if mode=1 mode$="Normal"
if mode=2 mode$="Wireframe"
if mode=3 mode$="Both"
print "1. Change viewing mode"
print "2. Back"
print ""
print "Viewing mode is set to: ",mode$
print ""
print "'Wireframe' allows you to see the grid only. 'Both' allows  you to see the landscape and the grid. 'Normal' allows you  to see the landscape without the grid."
input command
command=int(command)
if command<1 or command>2 then
print "Bad command or file name"
pause 1
goto modeset
fi
if command=1 then
mode=mode+1
if mode>3 mode=1
fi
if command=2 goto settings
goto modeset

label create
'time
settimehour=val(hour$)
settimemin=val(minute$)/60
timevalue=settimehour+settimemin
open window 640,512
window origin "lb"
clear window
dim matrix(resolution+1,resolution+1)
if angle=2 then

if mode>1 then
setrgb 1,255,255,255
rectangle 120,500 to 520,100
for x=1 to resolution
line x*400/resolution+120,100 to x*400/resolution+120,500
next x
for y=1 to resolution
line 120,y*400/resolution+100 to 520,y*400/resolution+100
next y
fi
label a
goto a
fi
