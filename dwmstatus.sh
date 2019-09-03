#!/bin/sh

setName()
{
  xsetroot -name "W: ${CONNECTED} | ${BAT} $(date)"
  sleep 1
}

while true; do
  CONNECTED=$(cat /sys/class/net/wlp2s0/operstate)
  quota=$(echo "$(cat /sys/class/power_supply/BAT0/capacity)/10" | bc)


  if [ $(cat /sys/class/power_supply/BAT0/status) == "Discharging" ]; then
    case $quota in
      "0")
        BAT="---------- |"
        setName
        BAT="---------  |"
        setName
        BAT="--------   |"
        setName
        BAT="-------    |"
        setName
        BAT="------     |"
        setName
        BAT="-----      |"
        setName
        BAT="----       |"
        setName
        BAT="---        |"
        setName
        BAT="--         |"
        setName
        BAT="-          |"
        setName
        BAT="           |"
        setName
      ;;
   
      "1")
        BAT="#--------- |"
        setName
        BAT="#--------  |"
        setName
        BAT="#-------   |"
        setName
        BAT="#------    |"
        setName
        BAT="#-----     |"
        setName
        BAT="#----      |"
        setName
        BAT="#---       |"
        setName
        BAT="#--        |"
        setName
        BAT="#-         |"
        setName
        BAT="#          |"
        setName
      ;;
      "2")
        BAT="##-------- |"
        setName
        BAT="##-------  |"
        setName
        BAT="##------   |"
        setName
        BAT="##-----    |"
        setName
        BAT="##----     |"
        setName
        BAT="##---      |"
        setName
        BAT="##--       |"
        setName
        BAT="##-        |"
        setName
        BAT="##         |"
        setName
      ;;
      "3")
        BAT="###------- |"
        setName
        BAT="###------  |"
        setName
        BAT="###-----   |"
        setName
        BAT="###----    |"
        setName
        BAT="###---     |"
        setName
        BAT="###--      |"
        setName
        BAT="###-       |"
        setName
        BAT="###        |"
        setName
      ;;
      "4")
        BAT="####------ |"
        setName
        BAT="####-----  |"
        setName
        BAT="####----   |"
        setName
        BAT="####---    |"
        setName
        BAT="####--     |"
        setName
        BAT="####-      |"
        setName
        BAT="####       |"
        setName
      ;;
      "5")
        BAT="#####----- |"
        setName
        BAT="#####----  |"
        setName
        BAT="#####---   |"
        setName
        BAT="#####--    |"
        setName
        BAT="#####-     |"
        setName
        BAT="#####      |"
        setName
      ;;
      "6")
        BAT="######---- |"
        setName
        BAT="######---  |"
        setName
        BAT="######--   |"
        setName
        BAT="######-    |"
        setName
        BAT="######     |"
        setName
      ;;
      "7")
        BAT="#######--- |"
        setName
        BAT="#######--  |"
        setName
        BAT="#######-   |"
        setName
        BAT="#######    |"
        setName
      ;;
      "8")
        BAT="########-- |"
        setName
        BAT="########-  |"
        setName
        BAT="########   |"
        setName
      ;;
      "9")
        BAT="#########- |"
        setName
        BAT="#########  |"
        setName
      ;;
      "10")
        BAT="********** |"
        setName
      ;;
      *)
        BAT="FULLY CHARGED"
        setName
      ;;
    esac
  else
    case $quota in
      "0")
        BAT="           |"
        setName
        BAT="+          |"
        setName
        BAT="++         |"
        setName
        BAT="+++        |"
        setName
        BAT="++++       |"
        setName
        BAT="+++++      |"
        setName
        BAT="++++++     |"
        setName
        BAT="+++++++    |"
        setName
        BAT="++++++++   |"
        setName
        BAT="+++++++++  |"
        setName
        BAT="++++++++++ |"
        setName
      ;;
      "1")
        BAT="#          |"
        setName
        BAT="#+         |"
        setName
        BAT="#++        |"
        setName
        BAT="#+++       |"
        setName
        BAT="#++++      |"
        setName
        BAT="#+++++     |"
        setName
        BAT="#++++++    |"
        setName
        BAT="#+++++++   |"
        setName
        BAT="#++++++++  |"
        setName
        BAT="#+++++++++ |"
        setName
      ;;
      "2")
        BAT="##         |"
        setName
        BAT="##+        |"
        setName
        BAT="##++       |"
        setName
        BAT="##+++      |"
        setName
        BAT="##++++     |"
        setName
        BAT="##+++++    |"
        setName
        BAT="##++++++   |"
        setName
        BAT="##+++++++  |"
        setName
        BAT="##++++++++ |"
        setName
      ;;
      "3")
        BAT="###        |"
        setName
        BAT="###+       |"
        setName
        BAT="###++      |"
        setName
        BAT="###+++     |"
        setName
        BAT="###++++    |"
        setName
        BAT="###+++++   |"
        setName
        BAT="###++++++  |"
        setName
        BAT="###+++++++ |"
        setName
      ;;
      "4")
        BAT="####       |"
        setName
        BAT="####+      |"
        setName
        BAT="####++     |"
        setName
        BAT="####+++    |"
        setName
        BAT="####++++   |"
        setName
        BAT="####+++++  |"
        setName
        BAT="####++++++ |"
        setName
      ;;
      "5")
        BAT="#####      |"
        setName
        BAT="#####+     |"
        setName
        BAT="#####++    |"
        setName
        BAT="#####+++   |"
        setName
        BAT="#####++++  |"
        setName
        BAT="#####+++++ |"
        setName
      ;;
      "6")
        BAT="######     |"
        setName
        BAT="######+    |"
        setName
        BAT="######++   |"
        setName
        BAT="######+++  |"
        setName
        BAT="######++++ |"
        setName
      ;;
      "7")
        BAT="#######    |"
        setName
        BAT="#######+   |"
        setName
        BAT="#######++  |"
        setName
        BAT="#######+++ |"
        setName
      ;;
      "8")
        BAT="########   |"
        setName
        BAT="########+  |"
        setName
        BAT="########++ |"
        setName
      ;;
      "9")
        BAT="#########  |"
        setName
        BAT="#########+ |"
        setName
      ;;
      "10")
       BAT="********** |"
       setName
      ;;
      *)
        BAT="FULLY CHARGED"
        setName
      ;;
    esac
  fi
done
