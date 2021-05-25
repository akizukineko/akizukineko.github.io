---
title: 將手機刷成 Resurrection Remix OS 的歷程
tags:
  - 刷機
  - 第三方系統
  - 手機
categories:
  - 刷機
keywords: 'Resurrection Remix,rom,紅米note4X,紅米note3,紅米,刷機,lineageos'
date: 2020-02-14 13:04:46
---

## 前言

由於我的紅米 note4X 在小米發布新的更新後被強制開夜間模式.....，然後他們居然忘記設計開關夜間模式的功能，導致通知欄跟鎖屏介面都變成黑的，通知都沒辦法看清楚。

所以決定做以前搞過得事 - 刷機，以前刷機是好玩，對其他 ROM 好奇，想嘗鮮嘗鮮，現在是為了解決夜間模式問題，還有一點就是他也在這次更新裝了使用反饋得功能，但又無法移除。

<!-- more -->

## 刷機歷程

這一個月我刷了兩台手機，紅米 note4X 跟紅米 note3，紅米 note4X 是為了解決通知問題，note3 是想說順便處理，不過在嘗試解鎖 bootloader 時，被小米告知帳號一個月只能解鎖一支手機傻眼zzzzz，所以2/1才能開工。

那紅米 note3 由於等不太下去，~~手賤~~嘗試強行解鎖 bootloader，使用了進入edl的方法，不過失敗了，當時還能正常開機，但2/1要解鎖時小米那邊辨識有問題，不給我解鎖也試過官方的問題解決方案，但依然不能解鎖，後來我發現我系統好像是開發版，~~腦殘~~想說大概有解鎖 bootloader 直接給他刷下去www，結果當然是變磚，後來找了鎖著依然能救的方法，嘗試了幾個方法都刷不進去，其中有個方法是用 edl 模式刷機，雖然沒辦法完成刷機但看狀態的確有東西刷入，那我假設他把原本一些系統檔案恢復了，再次嘗試解鎖 bootloader 成功了! 趕緊刷入 RR rom ，沒出什麼意外，手機正常開機。

## 刷機系統

其實我紅米 note4X 刷了兩次，一次用 LineageOS，後來在 note3 上嘗試 Resurrection Remix，發現不錯用就把 note4X也刷成了 RR 。

LineageOS: 一套熱門的開源 Android 系統，基於原本的 CyanogenMod，基本上系統算是蠻乾淨的，稍微有一些附加的功能，版本更新相當快速。

Resurrection Remix OS: 基於 Lineage 開發的開源系統，擁有更多個性化功能，更新很少，不過不影響使用。我目前選擇這個。

## 刷機方法

***刷機可能導致變磚，風險請自行承擔***

**另外刷機前請備份好所有需要的檔案，刷機會清除所有檔案**

### LineageOS
一開始當然是下載刷機包跟工具，LineageOS使用線刷的方式
Open Gapps 為 google 相關軟體
TWRP 為第三方 Recovery 功能非常多
使用到的檔案

* [LineageOS ROM](https://download.lineageos.org/mido#!user)
* [Open Gapps](https://opengapps.org/)
* [TWRP](https://twrp.me/xiaomi/xiaomiredminote4.html)
* [電腦ADB工具](https://wiki.lineageos.org/adb_fastboot_guide.html#setting-up-adb)
* 天氣app 跟 ROOT 請視自己情況自行下載

另外台灣的紅米 note4X (高通處理器) 國外叫 redmi note4 (他們的4X又是另外一台低階手機)
紅米 note4X 下載 mido 的刷機包
其實官方有教學可以直接參考這:[連結](https://wiki.lineageos.org/devices/mido/install)

我這邊稍微翻譯一些，首先安裝電腦 ADB 工具
接著解鎖 bootloader 另外解鎖後要重開機後要再次開啟 USB 偵錯

1.將手機跟電腦連接

2.這邊可以直接使用指令進入 Fastboot，若手動的時候方法為關機時同時按下 音量下鍵跟電源鍵
```bash
adb reboot bootloader
```
3.檢查一下是否有正確連結
```bash
fastboot devices
```
4.刷入 TWRP 記得改為TWRP的檔案名稱，另外檔案要放在命令列開啟的資料夾裡
```bash
fastboot flash recovery <TWRP檔案名稱>.img
```
5.進入 TWRP Recovery，手動進入方法為同時案住 音量上鍵跟電源鍵 直接 MI logo 顯示
```bash
fastboot boot <TWRP檔案名稱>.img0
```
6.將 ROM、Gapps 跟你要安裝的包放在命令列的資料夾裡

7.在 Recovery 中 Wipe 先跑一次 Format Data

8.選取 Advanced Wipe 選擇 *Cache* 跟 *System* 再清一次

9.回到主畫面，點選 Advanced，選擇裡面的 ADB Slideload 開始刷入檔案
  先刷入 ROM　再刷入 Gapps 之後則看你要不要刷入 root 的檔案
```bash
adb sideload 檔案名稱.zip
```

10.刷入完成後輸入，稍微等待後應該就能正常啟動了
```bash
adb reboot
```

### Resurrection Remix OS
RR 是卡刷包的形式不過到安裝 Advanced Wipe 時都一樣
一樣準備需要的軟體

* [Resurrection Remix OS ROM](https://get.resurrectionremix.com/)
* [Open Gapps](https://opengapps.org/)
* [TWRP](https://twrp.me/xiaomi/xiaomiredminote4.html)
* [電腦ADB工具](https://wiki.lineageos.org/adb_fastboot_guide.html#setting-up-adb)

這邊請將 ROM 跟 Open Gapps 放入 SD 卡中

9.回到主畫面選擇 Install 調整資料夾到 SD 卡，先選擇 RR ROM 再選擇 Open Gapps 刷入

10.刷完後重新啟動，稍等候就能進入系統了

這邊給幾張 Resurrection Remix OS 的截圖，還可以改一些選單之類的，剩下的給各位挖掘了

![](https://res.cloudinary.com/akizukineko/image/upload/v1581656393/2020/02/flash-rom/Screenshot-1.png)


![](https://res.cloudinary.com/akizukineko/image/upload/v1581656395/2020/02/flash-rom/Screenshot-2.png)


![](https://res.cloudinary.com/akizukineko/image/upload/v1581656394/2020/02/flash-rom/Screenshot-3.png)

參考資料:
[LineageOS](https://zh.wikipedia.org/wiki/LineageOS)
[CyanogenMod](https://zh.wikipedia.org/wiki/CyanogenMod#CyanogenMod_14.1)
[Resurrection Remix OS](https://en.wikipedia.org/wiki/Resurrection_Remix_OS)
[Install LineageOS on mido](https://wiki.lineageos.org/devices/mido/install)