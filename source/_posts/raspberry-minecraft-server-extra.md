---
title: Raspberry Minecraft 伺服器延伸資料
date: 2020-01-28 18:27:26
tags:
  - minecraft
  - Raspberry Pi
  - server
categories: 
 - Raspberry
keywords: raspberry pi,4B,minecraft,server,伺服器,架設,Spigot
---

## 本篇內容

這邊會整理一些 Raspberry 更好管理伺服器的軟體，還有一些相關資料
關於伺服器架設的部分可以參考這篇[使用 Raspberry 架設 Minecraft 伺服器](/raspberry-minecraft-server/)

大概會有
- screen 常用指令
- screen Bug 解決方法
- FTP
- PPPoE
- minecraft 插件
<!-- more -->
## screen 常用指令

### 開啟 screen
輸入
```bash
screen
```

### 暫時離開 screen
Ctrl + a 再按 d 即可

### 回到剛剛的連線
```bash
screen -r
```

### screen 清單
可能同時會有很多連線，使用這指令可以查看清單
```bash
screen -ls
```

### 選擇回到之前的連線
使用清單指令後應該會類似下圖
```bash
There are screens on:
        936.pts-0.raspberrypi   (01/28/20 23:27:33)     (Detached)
        928.pts-0.raspberrypi   (01/28/20 23:27:14)     (Detached)
2 Sockets in /run/screen/S-pi.
```

假設我要回到928的連線，可以像這樣子來達成，可以是完整的也可以是簡略的
```bash
screen -r 928.pts-0.raspberrypi #完整名稱
screen -r 928                   #僅數字
```

## screen 重新 attach 失敗
我是參考[這邊](https://blog.csdn.net/GW569453350game/article/details/46533319)的資料
假設928連線出問題按此操作，刪除此進程
```bash
ps -ef | grep bash | grep 928
kill 928
```

## 安裝 FTP 伺服器

這邊使用 vsftpd 來建立 ftp 伺服器

### 安裝 vsftpd
```bash
sudo apt-get install vsftpd
```

### 修改 vsftpd 設定檔
開啟設定檔進行修改
```bash
sudo nano /etc/vsftpd.conf
```

將這兩行程式前的 # 號去掉
```
local_enable=YES    

write_enable=YES
```

### 重新啟動 vsftpd
```bash
sudo service vsftpd restart
```
### 登入raspberry

FTP 軟體可以使用 [FileZilla](https://filezilla-project.org/download.php?show_all=1)

輸入 pi 的帳戶登錄即可

### 修改 root 使用者權限
```bash
sudo nano /etc/ftpusers
```
將 root 前的 # 號清除，儲存檔案

### 設定 root 密碼
```bash
sudo passwd root

sudo passwd –unlock root #解除 root 鎖定
```

重新啟動 raspberry 就能使用 root 帳戶登入 ftp 了

## 把 Raspberry 設定成固定 IP 連線

### 申請固定IP
[Hinet 固定 IP 申請網頁](http://service.hinet.net/2004/adslstaticip.php)
設定完成後馬上就可以使用，不過要使用撥接，所以先安裝撥接軟體
hinet撥接的話要在 hinet.net 前加上 ip
類似這樣: 8(7)xxxxxxx@ip.hinet.net

### 安裝撥接軟體
```bash
sudo apt-get install pppoeconf
```
### 設定撥號連線
安裝完成後要設定 Hinet 登入密碼
開啟設定程式
```bash
sudo pppoeconf
```

這邊他會請你備份他要修改的檔案，直接 Yes 即可
{% asset_img  pppoe.png %}

是否設定常用參數 Yes
{% asset_img  pppoe2.png %}

這邊輸入你的 Hinet 帳號
{% asset_img  pppoe3.png %}

輸入 Hinet 密碼
{% asset_img  pppoe4.png %}

是否儲存 ISP 提供的 DNS 設定值 Yes
{% asset_img  pppoe5.png %} 

最大分段容量 Yes
{% asset_img  pppoe6.png %} 

是否設定成開機啟動? Yes
{% asset_img  pppoe7.png %} 

是否現在撥接? Yes
{% asset_img  pppoe8.png %} 

一點指令介紹 Enter 即可
{% asset_img  pppoe9.png %}

這時輸入以下指令查詢 IP 位置
```bash
ifconfig ppp0
```
應該會看到這樣的畫面，分享最左邊的 IP 位置給朋友即可
{% asset_img  pppoeipconf.png %} 

## Minecraft 插件

把想安裝的插件放入 minecraft server 的 plugins 資料夾即可
可以在這邊找到你享用的插件 [plugins](https://www.spigotmc.org/resources/categories/spigot.4/)
可以在[這裡](https://www.spigotmc.org/wiki/compatible-plugins-by-release/)找到官方整理各版本可以使用的插件

### Dynmap
一個可以在瀏覽器顯示地圖及玩家所在位置的插件
[下載地址](https://www.spigotmc.org/resources/dynmap.274/)

放入 plugins 資料夾即可
伺服器啟動後，在瀏覽器開啟 http://localhost:8123/ 即可
如果要開放給別人看記得將8123 port 的權限給打開


## 參考資料
screen:
[使用 Screen 指令操控 UNIX/Linux 終端機的教學與範例](https://blog.gtwang.org/linux/screen-command-examples-to-manage-linux-terminals/)
[Linux - 終端機開發好物：多重視窗工具 screen 教學](https://mropengate.blogspot.com/2015/09/linux-screen.html)
[[Linux 文章收集] 使用 Screen 指令操控 UNIX/Linux 終端機的教學與範例](http://puremonkey2010.blogspot.com/2014/12/linux-screen-unixlinux.html)
[screen使用问题，重新attach失败：There is no screen to be resumed matching ***](https://blog.csdn.net/GW569453350game/article/details/46533319)

Ftp:
[【教學】樹莓派Raspberry PI(RASPBIAN)ftp伺服器安裝](http://tomchun.tw/tomchun/2015/11/30/1-370/)
[[Raspberry Pi 3] 在raspbian上建立FTP server](http://wuhsiublog.blogspot.com/2017/01/raspberry-pi-3-raspbianftp-server.html)
[在樹莓派上架設 FTP 伺服器](http://yhhuang1966.blogspot.com/2017/02/ftp.html)

PPPoE:
[Raspberry Pi 的基礎 - 直接連線 ADSL 或光纖撥接上網](http://blog.itist.tw/2015/02/raspberry-pi-pppoe-connection.html)
[Raspberry Pi 樹莓派 ADSL PPPoE 連線到網際網路](https://thinker-evans.blogspot.com/2015/04/raspberry-pi-adsl-pppoe.html)

Minecraft:
[在 Spigot 架設的 Minecraft 伺服器中安裝需要的插件教學](https://www.kjnotes.com/other/97)
