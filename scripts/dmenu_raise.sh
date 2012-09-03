#!/bin/sh
# http://urukrama.wordpress.com/2012/08/16/use-dmenu-to-raise-running-applications/
# Use dmenu to launch or raise and focus running applications

CMD=$(dmenu_path | dmenu -i -b -fn '-*-nimbus mono l-regular-r-normal-*-17-120-100-*-p-0-iso8859-15' -nb '#1C73B1' -nf '#A7C4D2' -sb '#A7C4D2' -sf '#435254')

# if no instance of the app has been started, launch one now
if [ -z "`wmctrl -lx | grep -i $CMD`" ]; then
    $CMD &
else
    # search for existing app on any desktop and move it to the current desktop
    app_on_any_desk=`wmctrl -lx | grep -i $CMD | cut -d ' ' -f 1`
    wmctrl -i -R $app_on_any_desk
    #wmctrl -i -a $app_on_any_desk
fi;
