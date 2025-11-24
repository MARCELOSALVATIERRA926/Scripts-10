#!/bin/bash

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#   INSTALADOR CHECKUSER – COMPATIBLE ADMRufu
#   Traducido, optimizado y sin conflictos
#     Por Fenix Mr
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

check_installed() {
    if [ -f "/bin/chall" ]; then
        return 0
    else
        return 1
    fi
}

clear

barra_progreso() {
    comando[0]="$1"
    comando[1]="$2"
(
    [[ -e $HOME/fin ]] && rm $HOME/fin
    ${comando[0]} > /dev/null 2>&1
    ${comando[1]} > /dev/null 2>&1
    touch $HOME/fin
) >/dev/null 2>&1 &

tput civis
echo -ne "\033[1;33mESPERE \033[1;37m- \033[1;33m["

while true; do
    for ((i = 0; i < 18; i++)); do
        echo -ne "\033[1;31m#"
        sleep 0.1
    done

    [[ -e $HOME/fin ]] && rm $HOME/fin && break

    echo -e "\033[1;33m]"
    tput cuu1
    tput dl1
    echo -ne "\033[1;33mESPERE \033[1;37m- \033[1;33m["
done

echo -e "\033[1;33m]\033[1;37m -\033[1;32m COMPLETADO!\033[1;37m"
tput cnorm
}

instalar_archivos() {

# 🔹 No modifica librerías del panel
apt install -y python3-pip figlet > /dev/null 2>&1

# 🔹 Dependencia sin interferir con Python interno del panel
pip3 install flask > /dev/null 2>&1

# 🔹 Rutas seguras fuera del panel
mkdir -p /usr/lib/checkgestor
mkdir -p /etc/licencec

# 🔹 Descargas oficiales
wget -q https://raw.githubusercontent.com/PhoenixxZ2023/checkUser2024/main/chall.sh -O /bin/chall
wget -q https://raw.githubusercontent.com/PhoenixxZ2023/checkUser2024/main/checkgestor.sh -O /bin/checkgestor
wget -q https://raw.githubusercontent.com/PhoenixxZ2023/checkUser2024/main/checkgestor.py -O /usr/lib/checkgestor/checkgestor.py

chmod +x /bin/chall
chmod +x /bin/checkgestor
chmod +x /usr/lib/checkgestor/checkgestor.py

echo "By: @nandoslayer" > /etc/licencec/telegram

sleep 2
}

instalar() {

# 🔹 No modifica zona horaria del panel si ya existe
if [ ! -f "/etc/timezone" ]; then
    echo "America/Argentina/Buenos_Aires" > /etc/timezone
    ln -fs /usr/share/zoneinfo/America/Argentina/Buenos_Aires /etc/localtime
    dpkg-reconfigure --frontend noninteractive tzdata > /dev/null 2>&1
fi

clear
echo -e "\E[44;1;37m     INSTALADOR CHECKUSER PARA APPS VPN      \E[0m"
echo -e "\E[44;1;37m  CONECTA4G | GLTUNNEL | DTUNNEL | ANYMOD   \E[0m"
echo -e "\E[44;1;37m   COMPATIBLE 100% CON ADMRufu / ADMRPlus   \E[0m"
echo -e "\E[44;1;37m        VERSIÓN 1.6 - By @TURBONET2023       \E[0m"
echo ""
echo -e "        \033[1;33m • \033[1;32mINICIANDO INSTALACIÓN\033[1;33m • \033[0m"
echo ""

barra_progreso instalar_archivos

clear
echo -e "\E[44;1;37m     INSTALACIÓN COMPLETADA CORRECTAMENTE    \E[0m"
echo ""
echo -e "\033[1;33mCOMANDO PRINCIPAL: \033[1;32mchall\033[0m"
echo -e "\033[1;33mUBICACIÓN: \033[1;37m/bin/chall\033[0m"
echo ""
echo -e "\033[1;33mCONTACTO TELEGRAM: \033[1;37m@TURBONET2023\033[0m"
echo ""
echo -ne "\n\033[1;32mPresione ENTER para continuar...\033[1;37m: "
read -r

# 🔹 Mantener historial limpio
cat /dev/null > ~/.bash_history && history -c
}

# Limpieza inicial sin tocar archivos del panel
cat /dev/null > ~/.bash_history && history -c

instalar
