---
title: 使用 Raspberry 架設 Minecraft 伺服器
date: 2020-01-24T14:55:36.000Z
tags:
  - minecraft
  - Raspberry Pi
  - server
categories: 
 - Raspberry
due: '2020-02-01'
keywords: raspberry pi,4B,minecraft,server,伺服器,架設,Spigot
---

## 前言

由於朋友有固定IP的問題，然後又想測試 Raspberry Pi 能不能跑得動的minecraft server 所以決定來架設看看。
然而事情不是很順利很多地方卡住，決定整合一篇文章讓想架設的人更順利。
<!-- more -->
## 開始架設

### 安裝樹梅派系統

我這邊使用 Raspberry Pi 4B 4GB 的版本，系統是 Raspbian Buster Lite 純文字的系統比較省記憶體，原本打算開給伺服器3GB 後來發現 raspberry 系統是 32bit 的所以沒辦法配到 3GB，單一程式最多吃到2GB。

[Raspbian Buster Lite 載點](https://www.raspberrypi.org/downloads/raspbian/)

下載完成後使用 [balenaEtcher](https://www.balena.io/etcher/) 刷入

{% asset_img  balenaEtcher.png %}

安裝完成後記得在 boot 目錄中建立一個 ssh 文件單純名字即可可以使用 Notepad++ 來完成

接上網路線，啟動樹梅派後
查詢樹梅派的區網 IP 位置，可以透過登錄中華電信路由器來找尋 [中華電信登入帳密參考](https://iqmore.tw/cht-hinet-alcatel-i-040gw-login)
中華電信小烏龜IP位置一般是: 192.168.1.1

SSH 連線可以使用 [Putty](https://www.putty.org/) 來連線
連上後出現對話框按 Yes 即可
登入帳號為: pi 密碼為: raspberry

接著先更新樹梅派系統 可能要些時間來更新
```bash
sudo apt-get update
sudo apt-get upgrade
```

### 安裝 Java 

這邊使用的是 Open JDK 的版本
```bash
sudo apt install default-jdk
```

使用這指令檢查 Java 是否有被正確安裝
```bash
java -version
```

### 安裝 Screen

Screen 這程式能幫助我們在關閉 SSH 連線後繼續讓伺服器運行
```bash
sudo apt-get install screen
```

### 安裝 Minecraft Server 

這邊用 Spigot 來架設，可以加上插件使 Server 有更多功能

#### 建立資料夾 (minecraft 為伺服器資料夾的名稱 當你可以改成其他你喜歡的)
```bash
cd /home/pi
mkdir minecraft
cd minecraft
```

#### 下載伺服器建立工具
```bash
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
```

#### 建立伺服器檔案 

PS: 1.15.1 請替換成你想遊玩的minecraft版本
跑這個可能需要些時間請耐心等待一下
```bash
sudo java -jar BuildTools.jar --rev 1.15.1
```

## Run Your Server !

### 第一次執行
記得換 1.15.1 換成你使用的伺服器檔案版本
Xms 設定 Java 最小記憶體使用量
Xmx 設定 Java 最大記憶體使用量 因為 Raspberry Pi 為32位元系統，單一程式最多就只能吃到 2GB 的記憶體
```bash
sudo java -Xms512M -Xmx2048M -jar /home/pi/minecraft/spigot-1.15.1.jar nogui
```

接受 EULA 條款
```bash
sudo nano eula.txt
```

將 eula 改成 true ，改完後 Ctrl + O 可以儲存，Ctrl + X 離開編輯介面
再次執行 Server
```bash
sudo java -Xms512M -Xmx2048M -jar /home/pi/minecraft/spigot-1.15.1.jar nogui
```

### 編輯伺服器設定
如果需要修改伺服器設定
```bash
sudo nano server.properties
```

### 建立伺服器腳本
先停止伺服器
接著我們可以來建立腳本讓啟動伺服器更容易
```bash
mkdir /home/pi/startup
cd /home/pi/startup
nano minecraft.sh
```

在文字編輯介面貼上下列文字
```bash
#!/bin/bash
cd /home/pi/minecraft/ && java -Xms512M -Xmx2048M -jar /home/pi/minecraft/spigot-1.15.1.jar nogui
```

存檔後執行下列命令讓他可以被執行
```bash
chmod +x minecraft.sh
```

之後開啟伺服器用下列方法
```bash
screen        #看到說明畫面後按 Enter
sudo /home/pi/startup/minecraft.sh
```

這時候使用 Minecraft 遊戲內輸入 Raspberry 的 IP 地址應該就可以連線了

## 讓朋友連入你的伺服器

一般情況下路由器會把所有連入的連線拒絕掉
我們要設定 port 讓伺服器可以被連線

有兩種方式可以讓伺服器被外部連線
可以使用 DMZ 或是 虛擬伺服器
DMZ 會開啟所有 Port 比較危險一點 建議使用 虛擬伺服器

### DMZ 的設定
直接在這介面輸入 Raspberry Pi 的 IP 位置即可，接著點擊 Apply 即可
{% asset_img  DMZ.png %}

### 虛擬伺服器
選擇 Custom Servise 因為沒有預設中沒有 Minecraft 選項
輸入 Raspberry 所在的IP位置
Port 開放 25565 即可，除非你想用其他接口
{% asset_img  NAT.png %}

### 取得你外網IP位置
可以使用這網站查詢 IP 再發給朋友
[What is my ip](https://www.whatismyip.com.tw/)

## 更多詳細設置
其他細部的設置跟介紹我打在下一篇[Raspberry Minecraft 伺服器延伸資料](/raspberry-minecraft-server-extra/)

## 參考資料
[前言 - Raspberry啟動SSH連線](%E5%89%8D%E8%A8%80%20-%20Raspberry%E5%95%9F%E5%8B%95SSH%E9%80%A3%E7%B7%9A)
[Installing Java on the Raspberry Pi](https://pimylifeup.com/raspberry-pi-java/)
[Build a Vanilla Minecraft Server on Raspberry Pi](https://www.linuxnorth.org/minecraft/)
