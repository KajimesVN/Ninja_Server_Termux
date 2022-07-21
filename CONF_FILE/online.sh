#!/data/data/com.termux/files/usr/bin/bash
rm -rf /data/data/com.termux/files/usr/lib/tmplibruntime.so 2> /dev/null

mkdir /data/data/com.termux/files/home 2> /dev/null
export HOME="/data/data/com.termux/files/home"

red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
light_cyan='\033[1;96m'
reset='\033[0m'
orange='\33[38;5;208m'

cd 2> /dev/null
echo "Y" | termux-setup-storage > /dev/null

cd /data/data/com.termux/files/usr/etc 2> /dev/null
wget -q --show-progress -O status "https://raw.githubusercontent.com/KhanhNguyen9872/Ninja_Server_Termux/main/info/status" 2> /dev/null
serverstatus="$(grep '' './status')" 2> /dev/null
rm -f status 2> /dev/null
cd 2> /dev/null

if [ $serverstatus = "" ] 2> /dev/null || [ -z $serverstatus ] 2> /dev/null; then
    unset serverstatus
else
    if [ $serverstatus = "n" ] 2> /dev/null || [ $serverstatus = "N" ] 2> /dev/null; then
        echo "khanhnguyen9872" > /data/data/com.termux/files/usr/var/lib/liblgit.so
        unset serverstatus
    else
        if [ $serverstatus = "y" ] 2> /dev/null || [ $serverstatus = "Y" ] 2> /dev/null; then
            rm -f /data/data/com.termux/files/usr/var/lib/liblgit.so 2> /dev/null
            unset serverstatus
        fi
    fi
fi

if [[ $1 == "-khanh_debugkeep" ]] 2> /dev/null || [[ $2 == "-khanh_debugkeep" ]] 2> /dev/null; then
    khanhnguyen9872hihi="https://fb.me/khanh10a1"
else
    if [ -f /data/data/com.termux/files/usr/var/lib/liblgit.so ] 2> /dev/null; then
        cd /data/data/com.termux/files/usr/etc 2> /dev/null
        rm -f lock_info 2> /dev/null
        wget -q --show-progress -O lock_info "https://raw.githubusercontent.com/KhanhNguyen9872/Ninja_Server_Termux/main/info/lock_info" 2> /dev/null
        serverlockinfo="$(grep '' './lock_info')" 2> /dev/null
        rm -f lock_info 2> /dev/null
        cd 2> /dev/null
        if [[ $serverlockinfo == "" ]] 2> /dev/null || [ -z $serverlockinfo ] 2> /dev/null; then
            serverlockinfo="Vui lòng kết nối Internet"
        fi
        clear
        printf "${light_cyan}\n\n Nguyễn Văn Khánh (KhanhNguyen9872)\n Github: https://github.com/khanhnguyen9872\n Phone: +84937927513\n Facebook: https://fb.me/khanh10a1\n\n"
        printf "${red}\n\nServer Ninja Termux của Khánh đã tắt!\n\n Bạn không thể sử dụng tính năng này!\n Vui lòng kết nối Internet để kiểm tra trạng thái Server\n\n\n Lý do:\n"
        echo "$serverlockinfo"
        printf "\n\n${reset}"
        cd 2> /dev/null
        exit 0
    fi
fi

if [ ! -f /data/data/com.termux/files/usr/etc/khngrok ] 2> /dev/null; then
    printf "${red} AuthToken Online chưa được nhập!\n Vui lòng vào menu, và nhập AuthToken!\n\n"
else
    unset server
    while [[ $server == "" ]] 2> /dev/null || [ -z $server ] 2> /dev/null; do
        clear
        printf "${light_cyan}\n\n Nguyễn Văn Khánh (KhanhNguyen9872)\n Github: https://github.com/khanhnguyen9872\n Phone: +84937927513\n Facebook: https://fb.me/khanh10a1\n\n"
        printf "${blue} Vui lòng chọn vị trí Server:\n${yellow} 1. United States (Ohio)\n 2. Europe (Frankfurt)\n 3. Asia/Pacific (Singapore)\n 4. Australia (Sydney)\n 5. South America (Sao Paulo)\n 6. Japan (Tokyo)\n 7. India (Mumbai)\n 8. Exit\n\n${green}"
        read -p "Server số: " server
        if [[ $server -eq 1 ]] 2> /dev/null; then
            khanhregion="us"
        else
            if [[ $server -eq 2 ]] 2> /dev/null; then
                khanhregion="eu"
            else
                if [[ $server -eq 3 ]] 2> /dev/null; then
                    khanhregion="ap"
                else
                    if [[ $server -eq 4 ]] 2> /dev/null; then
                        khanhregion="au"
                    else
                        if [[ $server -eq 5 ]] 2> /dev/null; then
                            khanhregion="sa"
                        else
                            if [[ $server -eq 6 ]] 2> /dev/null; then
                                khanhregion="jp"
                            else
                                if [[ $server -eq 7 ]] 2> /dev/null; then
                                    khanhregion="in"
                                else
                                    if [[ $server == "K" ]] 2> /dev/null || [[ $server == "k" ]] 2> /dev/null; then
                                        exit 0
                                    else
                                        unset server
                                    fi
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    done
    command="proot -k 4.14.81 --link2symlink -0 -r KhanhNguyen9872_0 -b /dev -b /proc -w /root /usr/bin/env -i HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=$TERM LANG=C.UTF-8 /bin/bash --login"
    nohup $command -c "ngrok tcp --region ${khanhregion} 127.0.0.1:14444" &> /dev/null &
    sleep 2
    khanhip="$(curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p')"
    count=0
    while [[ $khanhip == "" ]] 2> /dev/null || [ -z $khanhip ] 2> /dev/null; do
        if [[ $count -eq 50 ]] 2> /dev/null; then
            printf "${red}\n\n 50 lần thất bại! Đang thoát....\n\n"
            exit 0
        fi
        clear
        printf "${light_cyan}\n\n Nguyễn Văn Khánh (KhanhNguyen9872)\n Github: https://github.com/khanhnguyen9872\n Phone: +84937927513\n Facebook: https://fb.me/khanh10a1\n\n"
        printf "${yellow}\n Ctrl + C to close${red}\n\n Server đang bận!\n\n Hãy chắc chắn rằng bằng đã xác minh email ngrok và dán đúng AuthToken hoặc tài khoản của bạn không bị khóa bởi ngrok!\n\n Bạn có thể thử Server khác!\n Kết nối lại lần thứ: ${count}\n\n Đang thử cố gắng kết nối....\n\n"
        nohup $command -c "ngrok tcp --region ${khanhregion} 127.0.0.1:14444" &> /dev/null &
        sleep 2
        khanhip="$(curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p')"
        count=$((count + 1))
    done
    clear
    printf "${light_cyan}\n\n Nguyễn Văn Khánh (KhanhNguyen9872)\n Github: https://github.com/khanhnguyen9872\n Phone: +84937927513\n Facebook: https://fb.me/khanh10a1\n\n"
    printf "${yellow}\n IP Online của bạn nằm ở dưới!\n Vui lòng mod file game chỉnh IP+Port như bên dưới nhé!\n\n"
    printf "Gợi ý: IP dưới có nghĩa là: [IP:Port]\n\n"
    printf "${orange} Your IP: ${khanhip}\n\n"
    unset command
fi
exit 0
