---
title: 加入 NEXT 主題背景圖片(NEXT V7.7.0)
date: 2020-01-31T04:43:46.852Z
tags:
 - hexo
 - NEXT
categories: 
 - Hexo
 - NEXT
keywords: Hexo,NEXT,bakground,picture,背景圖片
---
NEXT 是一個很多人用的主題，想跟別人不一樣加入背景圖片會看起來改變很多

找了一些網路資料蠻多還是舊版本的，整理一個新的給大家

<!-- more -->

### 修改主題設置

先打開主題設置文件，在上面的地方找尋custom_file_path的設置，把最後的style的 # 號去掉

{% asset_img customcss.png %}

### 建立背景圖片設置

在 **部落格根目錄** source 資料夾裡面建立 _data 然後建立檔案 styles.styl
(~~我原本以為是建立在Next裡面~~)

```css
body {
      background:url(/images/background.jpg);
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-position:center center;
}
```
* URL : 設定成你存放圖片的位置，我這邊使用自己的圖片，所以不是使用網址，圖片放在**根目錄**的資料夾即可，若想使用別人自動撥放圖片可以使用這個:https://source.unsplash.com/
* Size : 背景圖片的大小
  * auto : 維持原本圖片的大小
  * cover : 當背景圖片小於容器時會放大填滿，如果圖片長寬比例不吻合可能出現失真
  * contain : 當圖片大於容器，縮小至容器內呈現
* repeat : 是否重複放置圖片
* attachment: 是否跟著滑鼠滾動
    * scroll : 隨著滑鼠滾動
    * fixed : 背景圖片固定
* position : 定義圖片位置，前者為水平方向，後者為垂直方向
    * 水平方向 : left 、 center 、 right
    * 垂直方向 : top 、 center 、 bottom

這時圖片基本設定就修改好了

### 修改主題跟側欄透明度

#### 修改主題透明度

```css
.main-inner {
      background: #fff;
      opacity: 0.95;
}
```
* backgroud 為背景色
* opacity 為主題透明度，如果希望背景背景圖片更清楚可以調低這個數值(我看大多數人使用0.8~0.9之間)但我希望內容可以更清楚，故只使用0.95

#### 修改側欄透明度

```css
.header-inner {
      opacity: 0.95;
}
```
* opacity 主題透明度

### 完整程式碼範例

```css
body {
      background:url(/images/background.jpg);
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-position:center center;
}

.main-inner {
      background: #fff;
      opacity: 0.95;
}

.header-inner {
      opacity: 0.95;
}
```


### 參考資料
[Hexo-NexT 设置博客背景图片](https://tding.top/archives/761b6f4d.html)
[为 Hexo 主题 next 添加图片背景](https://blog.diqigan.cn/posts/add-background-picture-for-next.html)
[hexo+github建站之背景图片](https://chengqian90.com/Hexo/hexo+github%E5%BB%BA%E7%AB%99%E4%B9%8B%E8%83%8C%E6%99%AF%E5%9B%BE%E7%89%87.html)
[hexo next 7.xx 添加背景图片](https://www.ling218.cn/archives/32702.html)
[hexo next 7.xx添加背景圖片](https://bufsnake.github.io/hexo-next-7-xx%E6%B7%BB%E5%8A%A0%E8%83%8C%E6%99%AF%E5%9B%BE%E7%89%87)
[CSS background-image 背景圖片](https://www.wibibi.com/info.php?tid=75)