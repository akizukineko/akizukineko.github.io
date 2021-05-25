---
title: Hexo 使用的 Markdown 語法及 NEXT 的 Tags
date: 2020-02-11 16:47:34
tags:
 - Hexo
 - NEXT
 - Markdown
categories:
 - Hexo
 - NEXT
keywords: Hexo,語法,Markdown,tags,NEXT
---

## 內容

這邊會整理 Hexo 寫作用的 Markdown 語法，還有 NEXT 主題用到的一些 Tags 會包含
* 標題
* 文字樣式
* 表格
* 超連結
* 插入圖片
* Hexo tags
* NEXT tags

<!-- more -->

## 文字語法、文章相關

### 文字樣式
| 文字樣式 | 程式碼 | 文字樣式 | 程式碼 |
|:---:|:---:|:---:|:---:|
| **粗體** | ` **粗體** ` | *斜體* | ` *斜體* ` |
| ~~刪除縣~~ | ` ~~刪除縣~~ ` | ***粗斜體*** | `***粗斜體***` |

### 標題

各種標題打法
```markdown
一級標題在下方使用等於
===
二級標題使用減號
---
```

一般可以使用這樣
```markdown
# 一級標題
## 二級標題
### 三級標題
...
###### 六級標題
```

### 程式碼

可以在行內使用 `將程式碼前後框起來

或著使用三個`製造多行程式碼區塊，可在第一行反引號後面加上程式語言

### 分隔線

分隔線可以使用三種方法達成
```markdown
*** 星號
--- 減號
___ 底線
```

### 項目符號及編號
項目符號可以使用星號、加號及減號，記得符號跟文字間要空一格，另外也可以用空格做成多階層的項目
```markdown
* 項目一
* 項目二
* 項目三
  * 項目三-1
  * 項目三-2
    * 項目2-1 
```
* 項目一
* 項目二
* 項目三
  * 項目三-1
  * 項目三-2
    * 項目2-1 

編號使用的是數字，同樣請記得空格，同樣可以做成多階層
```markdown
1. 編號一
2. 編號二
3. 編號三
    1. 三-1
    2. 三-2
        1. 三-2-1
```
1. 編號一
2. 編號二
3. 編號三
    1. 三-1
    2. 三-2
        1. 三-2-1

### 待辦事項

類似項目符號不過加入了格子可供選取
```markdown
* 事項一
* [ ] 事項二
* [x] 事項三
  * [ ] 事項三-1
  * [x] 事項三-2
    * [ ] 項目2-1 
```
* 事項一
* [ ] 事項二
* [x] 事項三
  * [ ] 事項三-1
  * [x] 事項三-2
    * [ ] 項目2-1 


### 連結
左邊為連結名稱，右邊是網址連結
```markdown
[Akizuki Neko](https://akizukineko.tw/)
```
[Akizuki Neko](https://akizukineko.tw/)

### 引用
引用文字內容使用，也可以是多階層的
```markdown
> 第一行
> 第二行
> > 第二階
> > > 第三階
```
> 第一行
> 第二行
> > 第二階
> > > 第三階

### 插入圖片

#### 一般插入圖片
左邊為圖片名稱(可留白)，右邊為圖片連接
``` markdown
![照片](https://res.cloudinary.com/akizukineko/image/upload/v1581416107/2020/02/hexo-new-NEXT-tags/IMG_2827_zoi9co.jpg)
```
![照片](https://res.cloudinary.com/akizukineko/image/upload/v1581416107/2020/02/hexo-new-NEXT-tags/IMG_2827_zoi9co.jpg)

#### Hexo 插入圖片方法
當你開啟 asset 資料夾設定時可以使用這個方法
```markdown
{% asset_img IMG_2873.JPG %}
```
{% asset_img IMG_2873.JPG %}

## Hexo 標籤外掛
~~其實感覺多數蠻少用到的~~，詳細可以參考 [標籤外掛（Tag Plugins）](https://hexo.io/zh-tw/docs/tag-plugins)
這邊嘗試兩個看看

### 引用Twitter
```markdown
{% blockquote @4sakana5 https://twitter.com/4sakana5/status/1223948318176247815 %}
テキサス
{% endblockquote %}
```
{% blockquote @4sakana5 https://twitter.com/4sakana5/status/1223948318176247815 %}
テキサス
{% endblockquote %}

### Youtube
Youtube 在後面貼上影片ID即可
```markdown
{% youtube t7MBzMP4OzY %}
```
{% youtube t7MBzMP4OzY %}

## NEXT 標籤
### note標籤
```markdown
{% note [class] [no-icon] %}
文字內容
{% endnote %}

[樣式]   : default | primary | success | info | warning | danger.
[是否包含圖示]] : Disable icon in note.
這兩者也可以不設定
```

樣式範例

#### 標籤
{% note %}
### 基礎標籤
註釋文字
{% endnote %}

#### 預設
{% note default %}
### 預設標籤
註釋文字
{% endnote %}

#### 主要
{% note primary %}
### 主要標籤
註釋文字
{% endnote %}

#### 資訊
{% note info %}
### 資訊標籤
註釋文字
{% endnote %}

#### 成功
{% note success %}
### 成功標籤
註釋文字
{% endnote %}

#### 警告
{% note warning %}
### 警告標籤
註釋文字
{% endnote %}

#### 危險
{% note danger %}
### 危險標籤
註釋文字
{% endnote %}

### Tabs
想使用這個標籤必須要在 NEXT 設定文件打開
使用方法
```markdown
{% tabs Unique name, [index] %}
<!-- tab [Tab caption] [@icon] -->
Any content (support inline tags too).
<!-- endtab -->
{% endtabs %}

Unique name : Tabs的名字，不可與這頁面使用的 Tabs 名稱重複。
[index] : 選擇哪個標籤被預設開啟，-1 則不預設任何標籤。
[Tab caption] : 標籤標題，若不輸入則以 Unique name 加上數字設定。
[@icon] : FontAwesome icon 內圖標的名字(不須加上fa-)，
          圖標樣式可以參考這裡 https://fontawesome.com/v4.7.0/icons/
```

#### 範例標籤
```markdown
{% tabs 範例標籤一 %}
<!-- tab -->
**第一個標籤。**
<!-- endtab -->

<!-- tab -->
**第二個標籤。**
<!-- endtab -->

<!-- tab -->
**第三個標籤。**
<!-- endtab -->
{% endtabs %}
```
{% tabs 範例標籤一 %}
<!-- tab -->
**第一個標籤。**
<!-- endtab -->

<!-- tab -->
**第二個標籤。**
<!-- endtab -->

<!-- tab -->
**第三個標籤。**
<!-- endtab -->
{% endtabs %}

#### 範例標籤帶圖標
```markdown
{% tabs 範例標籤二 %}
<!-- tab Youtube @tyoutube-play -->
[**Youtube**](https://www.youtube.com/)
<!-- endtab -->

<!-- tab Github @github -->
[**Github**](https://github.com/)
<!-- endtab -->

<!-- tab Facebook @facebook-official -->
[**Facebook**](https://www.facebook.com/)
<!-- endtab -->
{% endtabs %}
```
{% tabs 範例標籤二 %}
<!-- tab Youtube @tyoutube-play -->
[**Youtube**](https://www.youtube.com/)
<!-- endtab -->

<!-- tab Github @github -->
[**Github**](https://github.com/)
<!-- endtab -->

<!-- tab Facebook @facebook-official -->
[**Facebook**](https://www.facebook.com/)
<!-- endtab -->
{% endtabs %}


參考資料:
[[教學] 撰寫 Hexo 文章 - Markdown 語法大全](https://ed521.github.io/2019/08/hexo-markdown/)
[Hexo-Markdown語法](https://yuxzs.github.io/2019/08/09/Hexo-Markdown%E8%AA%9E%E6%B3%95/)
[hexo下的markdown语法](https://fengmumu1.github.io/2018/06/29/hexo-markdown-grammar/)
[Hexo - Post asset folder](http://larrynung.github.io/2016/06/29/Hexo-Post-asset-folder/)
[標籤外掛（Tag Plugins）](https://hexo.io/zh-tw/docs/tag-plugins)
[Tag Plugins](https://theme-next.org/docs/tag-plugins/)