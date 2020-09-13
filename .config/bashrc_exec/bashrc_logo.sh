#!/bin/bash

#-------------------------------------------------------------------------------#
#################  File informations  ##########################################
#-------------------------------------------------------------------------------#
# This file allows to show the main information of system with its Logo Arch
# Linux. It is executed by .bashrc when the profile is loaded after the boot.
# .bashrc is located in [~] directory.


#-------------------------------------------------------------------------------#
#################  Function of the script  #####################################
#-------------------------------------------------------------------------------#
# Operation to find the number of package installed on the distribution
function Nb_packages() {
    pacman -Qe | wc -l
}

# Command to show how much time has been spent for the bootloading of system
function Uptime() {
    uptime -p
}

# Command to show the release of the current kernel
function Kernel_relaese() {
    uname -r
}

# Command to show the distrib
function Node() {
    uname -n
}

# fonction that show how much users are logged in the session
function Nb_users() {
  value="w | awk '{print $1;}' | wc -l"
  value=`eval $value`
  let "value = $value - 2"
  echo "$value"
}

# Command to show the information name of CPU
function cpu_modelname() {
   cat /proc/cpuinfo | grep name | awk 'FNR == 1 {print $4$5$6$7$8$9}'
}

# Command to show the information name of GPU
function gpu_modelname() {
   lspci | grep VGA | cut -d ":" -f3
}

function Ram_used() {
    free -m | grep Mem | awk '{print $3}'
}

function Ram_free() {
    free -m | grep Mem | awk '{print $4}'
}


#-------------------------------------------------------------------------------#
#################  Design into the terminal screen  ############################
#-------------------------------------------------------------------------------#
echo -e "                                                                                    "
echo -e "                                                                                    "
echo -e "\e[38;5;32m                    !                                                              \e[0m "
echo -e "\e[38;5;32m                    #\e[38;5;136m                        ===> Logged-in user : \e[38;5;160m$LOGNAME         "
echo -e "\e[38;5;160m                   ##\e[38;5;32m#\e[38;5;136m                      .;#############################;.       "
echo -e "\e[38;5;160m                  #####\e[0m                                                             "
echo -e "\e[38;5;160m                  ######\e[38;5;32m                     -> WM       :    \e[0m i3wm                 "
echo -e "\e[38;5;32m                 ; \e[38;5;160m#####;\e[38;5;32m                    -> Term     :    \e[0m $TERM                "
echo -e "\e[38;5;32m                +##.\e[38;5;160m#####\e[38;5;32m                    -> Shell    :     \e[0mBash                 "
echo -e "\e[38;5;32m               +#####\e[38;5;160m#####\e[38;5;32m                   -> Uptime   :     \e[0m$(Uptime)            "
echo -e "\e[38;5;32m              ######\e[38;5;32m###\e[38;5;160m####;\e[38;5;32m                                                        "
echo -e "\e[38;5;32m             #####\e[38;5;160m####\e[38;5;32m###\e[38;5;160m###+\e[38;5;32m                -> Packages :    \e[0m $(Nb_packages)       "
echo -e "\e[38;5;32m            #####\e[38;5;160m##    ###\e[38;5;32m#\e[38;5;160m###\e[38;5;32m               -> Kernel   :     \e[0m$(Kernel_relaese)    "
echo -e "\e[38;5;32m          .#####\e[38;5;160m#;      ;##\e[38;5;32m#;\e[31m'^.\e[38;5;32m             -> Distrib  :     \e[0m$(Node)              "
echo -e "\e[38;5;32m         .####\e[38;5;160m###;      ;##\e[38;5;32m###.\e[38;5;32m              -> UserLog  :     \e[0m$(Nb_users)          "
echo -e "\e[38;5;32m         ###\e[38;5;160m######.    .####\e[38;5;32m####'\e[38;5;32m                                                   "
echo -e "\e[38;5;32m        #\e[38;5;160m#####'            '#\e[38;5;32m#####\e[38;5;32m           -> CPU      :     \e[0m$(cpu_modelname)     "
echo -e "\e[38;5;160m       ;####                  \e[38;5;32m####;\e[38;5;32m          -> GPU      :    \e[0m$(gpu_modelname)      "
echo -e "\e[38;5;160m      ##'                        \e[38;5;32m'##\e[38;5;32m         -> RAM used :     \e[0m$(Ram_used)          "
echo -e "\e[38;5;32m     #'           WelcomE          \e[38;5;160m'#\e[38;5;32m        -> RAM free :     \e[0m$(Ram_free)          "
echo -e "                                                                                    "
echo -e "                                                                                    "
echo -e ""

