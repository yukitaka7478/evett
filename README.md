# アプリケーション名
Evett

# アプリケーション概要
やりたいイベントをシェアしながらお金を集めることができる。

# URL
https://evett.herokuapp.com/

# テスト用アカウント

・ Basic認証ID ：admin

・ Basic認証パスワード ：2222

・ メールアドレス :test-user@gmail.com

・ パスワード :testuser1

# 利用方法
## Evett(Event wallet)を投稿する
1. ユーザー新規登録を行う
2. 新規投稿ボタンから、evett名、説明、金額（目標期日は任意、公開範囲はデフォルトが全体公開）を入力して投稿する
3. 投稿の公開範囲は、①全体②友達のみ③自分のみ の３つから選択できる

## 投稿されたEvettに入金する
1. 一覧ページ、投稿詳細ページ、マイページの入金ボタンから入金できる
2. 入金ボタンから、金額とクレジットカード情報を入力して入金する(マイページにカード情報を保存してあれば、入金の際に入力が省略される)

## ユーザーをフォローする
1. 自分以外のマイページのユーザー名の隣に「フォローする」ボタンを押せる
2. フォローしたユーザー、フォローされたユーザーはマイページの「ユーザー情報」欄で確認できる
3. フォローしたユーザーが「友達に公開」で投稿したevettを閲覧できるようになる

# アプリケーションを作成した背景
大学時代の友人たちと旅行に行った際に、最後に集金をして時間がかかっていた所が印象に残って勿体無い思いをした体験があった。そこから「もっと楽に旅行だけを楽しめたらいいな」と考え、「イベントごとに財布を作ってそこに集金すれば、その場でわざわざ集金しないで済むな」という発想に行き着いた。PayPayの送金機能やLINEPayのわりかん機能も参加者全員が同じサービスを使えるよう事前に設定が必要なので、そうしたちょうど使いやすいサービスが無いと考えた。

# 洗い出した要件

[要件を定義したシート](https://docs.google.com/spreadsheets/d/1DIx4kE59IpTq_3PjbDBFgqGh8XzyoctrQt7RUybdLP8/edit?usp=sharing)  


# 実装した機能についての画像やGIFおよびその説明※
## evett一覧機能
ヘッダーのタグから非同期で表示を変更できる  

[![Image from Gyazo](https://i.gyazo.com/2f96c31c284ee5651fb47a9684430c9b.gif)](https://gyazo.com/2f96c31c284ee5651fb47a9684430c9b) 

## evett投稿機能
右下の「投稿する」ボタンから投稿画面に遷移できる  

[![Image from Gyazo](https://i.gyazo.com/bfe6de7de88e1474381296ac375a7aad.gif)](https://gyazo.com/bfe6de7de88e1474381296ac375a7aad) 

必要事項を入力すると投稿できる（公開範囲はデフォルトで全員が選択されており、目標日は任意）  

[![Image from Gyazo](https://i.gyazo.com/1ba002efbc134c42e87aaf5805af81d0.gif)](https://gyazo.com/1ba002efbc134c42e87aaf5805af81d0)  

## evett詳細機能
投稿時入力した全ての情報が表示されている  
ユーザー名をクリックするとそのユーザーのマイページに遷移する  

[![Image from Gyazo](https://i.gyazo.com/5279247773a7cd746e511a97d3c04d10.png)](https://gyazo.com/5279247773a7cd746e511a97d3c04d10)  

## evett編集機能
自分が投稿したevettの右上のメニューエリアにカーソルを合わせると「編集」「削除」ボタンが表示される  
「編集」ボタンを押すと目標日以外の情報が保存されて編集ページに遷移する  
目標日が入力されている場合は『「目標日」が設定されています』というアナウンスが表示される  

[![Image from Gyazo](https://i.gyazo.com/4c9ebb513e73460df2351912e59222a1.gif)](https://gyazo.com/4c9ebb513e73460df2351912e59222a1)  

「削除」ボタンを押すと削除して直前のページに遷移する  
[![Image from Gyazo](https://i.gyazo.com/32370a6b34d47d68b89e0059fc8ae39f.gif)](https://gyazo.com/32370a6b34d47d68b89e0059fc8ae39f)  

## evett入金機能
クレジットカードを登録していないユーザーの場合  
金額とクレジットカード情報を登録することで入金できる
[![Image from Gyazo](https://i.gyazo.com/e8d522a67c51926c072a5a5c02b13101.gif)](https://gyazo.com/e8d522a67c51926c072a5a5c02b13101)  

既にユーザーがクレジットカードを登録している場合  
金額を入力すると入金することができる
[![Image from Gyazo](https://i.gyazo.com/58b671996780e2b5d5cbb6c40440a0a6.gif)](https://gyazo.com/58b671996780e2b5d5cbb6c40440a0a6)  

## ユーザー新規登録ページ
ニックネーム、メールアドレス、パスワード、確認用パスワードを入力して新規登録できる
[![Image from Gyazo](https://i.gyazo.com/de6cd47913c0d0f4ea6d67c28f4fc4c3.gif)](https://gyazo.com/de6cd47913c0d0f4ea6d67c28f4fc4c3)  

## ユーザーログインページ
メールアドレス、パスワードを入力してログインできる
[![Image from Gyazo](https://i.gyazo.com/ed51f49906bde1d0e0a03ff0c1061ff0.gif)](https://gyazo.com/ed51f49906bde1d0e0a03ff0c1061ff0)  

## ユーザーマイページ
ヘッダーのユーザー名から自分のマイページに遷移できる（クレジットカードを登録しないとマイページに入れないようになっている）  
[![Image from Gyazo](https://i.gyazo.com/7f68e176a508f10978b773a6319780fa.gif)](https://gyazo.com/7f68e176a508f10978b773a6319780fa)  

evett一覧とユーザー情報のタグがあり、前者は投稿したevettと入金したevettが表示されており、後者は３つの要素が表示されている  
1. クレジットカード情報  
登録したクレジットカード情報が表示される
2. 友達一覧
フォローしているユーザーとフォローされているユーザーが表示される  
フォローしたユーザー
3. 友達検索フォーム
DBに登録されているユーザーの中から非同期で検索することができる  
evett詳細ページのユーザー名、友達一覧のユーザー名、検索したユーザー名をクリックすることで他のユーザーのマイページに遷移することができる  
先述のevett一覧とユーザー名の隣のフォローボタン（「フォローする」か「フォロー解除」）が表示されている  
フォローボタンを押すとフォロー、もしくはフォロー解除ができる  

[![Image from Gyazo](https://i.gyazo.com/39998023ae97b694e37ca4645503288b.gif)](https://gyazo.com/39998023ae97b694e37ca4645503288b)  

# 実装予定の機能
入金合計額、投稿合計額などのevett関連のデータの表示や出金機能の実装を予定。

メールアドレスやパスワードを用いず、一時的なトークン発行をして簡易的なログインができる機能を実装したい。

投稿にタグ付け機能やグループ分けをできるような機能の実装も考えている。

# データベース設計
[![ER図](/app/assets/images/evett_db.png)]

# 画面遷移図
[![画面遷移図](/app/assets/images/flaw.png)]

# 開発環境
・ フロントエンド

・ バックエンド

・ インフラ

・ テスト

・ テキストエディタ

・ タスク管理

# ローカルでの動作方法※
以下のコマンドを順に実行

% git clone https://github.com/yukitaka7478/evett

% cd xxxxx

% bundle install

% yarn install

# 工夫したポイント※
## サービス運営を想定した設計
・自分の使いたいサービスが実際にどのような見た目であればより使いたくなるのか。  
・色々できるサービスはあるけど、それらができていないサービスは何か。  
・いかに既存のサービスで使われている要素を組み込んでストレスなく使用できるか。  
・今の自分の技術だけで作れそうなものか。
こうした点を中心に工夫した。
## 直感的なビュー
Evettのメニュー（編集、削除ボタン）を左上、入金状況をバーと右下のパーセンテージで表現した。evett一覧で表示する情報量のバランスに苦労した。  
Javascriptを用いて、ヘッダーのタグで一覧表示された投稿を切り替えられるようにした。アクションが割り振られていないボタンや表示を極力省略し、どのボタンも何かしらの役割を持たせてある。
## シンプルな機能
基本的な機能は、①投稿②入金 の二つにした。なぜならこのアプリケーションは友達同士や自分で使う前提で、不特定多数の人々と繋がることを一番においていないからだ。友達同士のコミュニケーションはこのアプリではなく既存のSNSで行えばよい。そのためそれらのSNSで行えない金銭のやり取り機能を実装した。
## 公開範囲の設定
Evettの公開範囲は３種類に設定している。  
1. 全体公開  
evett投稿ではデフォルトで全体に公開されるようになっている。誰でも閲覧、入金できる状態。知らない人から入金されることはほとんど無いとは思うが、使われるイメージとしてはAmazonのほしい物リスト。
2. 友達のみ公開  
自分をフォローしてくれているユーザーのみに表示できる機能。フォローしたユーザーに公開できる訳ではないが、フォロー、フォロワーの関係性が理解できているスマホユーザーレベルであればストレスなく理解できると考える。
3. 自分のみ公開  
自分以外のユーザーに表示させない機能。
## 多様な使い方
Evettは大きく二つの使い方を想定している。（３つ目の使い方は多くのユーザーが使用してからを想定している。）
1. 個人用の用途別口座  
貯金をする際に「車を買うため」「欲しいものを買うため」と何かしらの目的を決める人は多い。しかし口座や財布は単なるお金の入れ物に過ぎず、目的に沿ったラベリングができる作りになっていない。目の前の誘惑に負けて貯金を使ってしまい後悔する事を防ぐためにお金をプールできる。  

2. 複数人の共有口座  
学生時代の友人や会社の同僚、家族と旅行に行く際に、都度都度事前、事後に集金をすることは非効率的である。LINEグループがあるのならグループ口座があっても良いと考えた。そうすることで、事前に多めに集め当日はevettから引き出すも良し、当日は誰かが立て替えて後日Evettに集金するも良し。当日お金の心配をせずにイベントを楽しめるはずだ。  

3. 法人、個人向けのイベント公開プラットフォーム  
Evettの公開範囲は前述の通り３種類に分けられている。各種SNSの多くは全体公開の機能を検索というステップを踏ませて限定的にしている。それはSNSでの投稿がコストが低く一覧表示させるには投稿が多すぎるからだ。しかしEvettはイベントの投稿という性質上SNSと比較して投稿コストが大きい。そのためクラウドファンディングのプロジェクトやECサイトの商品のようにイベントを投稿できるプラットフォームとしての使い方も可能だろう。これらのサービスはアクセスへのハードルが高い。それに比べてEvettは貯金や入金といった習慣や必要な作業がベースとなっているので、プラットフォームとして高い素質があるように考えられる。