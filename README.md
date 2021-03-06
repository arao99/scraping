# スクレイピング勉強会

## 環境の準備

Macを前提にしています。  
既に導入しているところは適宜飛ばしてください。

### rbenvの導入(Ruby環境の構築)

[rbenv を利用した Ruby 環境の構築](http://dev.classmethod.jp/server-side/language/build-ruby-environment-by-rbenv/)  
Capybara(後述)を利用する場合、Rubyのバージョン2.2以上が求められるので、バージョン2.2.5の導入を推奨します。  
このリポジトリでも、.ruby-versionでバージョン2.2.5を指定しています。

### Bundlerの導入

[Bundlerの使い方](http://qiita.com/oshou/items/6283c2315dc7dd244aef)  
プロジェクトごとに使用するgemを管理するためのgem、Bundlerをインストールしましょう。  
gemの管理がしやすくなるので、絶対にあったほうがいいです。

### MySQLの導入

[Mac へ MySQL を Homebrew でインストールする手順](http://qiita.com/hkusu/items/cda3e8461e7a46ecf25d)  
[MySQL5.7のvalidate_passwordとかいうクソ機能殺す](http://thr3a.hatenablog.com/entry/20160229/1456727388)  
このあたりを参考にして進めるといいと思います。  
ローカルで動かすだけであればパスワードを設定しなくてもいいと思うので、その場合はクソ機能を殺しておきましょう。

### Sequel Proの導入(MySQLを操作できるソフト)

[Sequel Pro](https://www.sequelpro.com/)  
[MySQL管理ソフトのSequel Pro入門](http://www.task-notes.com/entry/20150131/1422699221)  
MacでMySQLを使うなら入れておいた方がいいです。  
既に似たようなソフトを導入しているのなら、そちらでも大丈夫かと思います。

## gemのインストールおよびgemの説明

### Bundlerを利用したgemのインストール

git cloneしてきたら、まずはgemをインストールしてしまいましょう。  
今回の勉強会で使いそうなgemをGemfileにまとめたので、以下のコマンドでBundlerを利用してインストールします。

```
$ bundle install --path .bundle
```

ここでインストールしたgemを使用したい場合、コマンドの前に、"bundle exec"をつけてください。

```
$ bundle exec ruby hoge.rb
```

### gemの説明

#### Nokogiri

CSSセレクタを使ってhtmlソースから必要な情報を抽出するのに使います。  
XPathも使えますが、CSSセレクタの方がわかりやすいと思います。

#### Mechanize

ウェブアクセスをエミュレートするのに使います。  
ログインが必要なサイトのスクレイピングが簡単にできるようになります。

#### Capybara, Poltergeist

Capybaraは、ブラウザ上のアクションをシミュレートするのに使います。  
ドライバーにPhantomJSを用いることで、JavaScriptにも対応できます。  
PhantomJSはHomebrewでインストールしてしまいましょう。

```
$ brew install phantomjs
```
  
Poltergeistは、RubyからPhantomJSを扱えるようにしてくれるgemです。

#### Active Record, MySQL2

Active Recordは、データベースにアクセスするのに使います。  
Railsで利用されているイメージがあるかもしれませんが、Ruby単体でも使えます。  
MySQL2は、MySQLに接続するためのアダプタです。

#### fastimage

画像サイズを調べるのに使います。  
画像の取捨選択などに活用できます。

## サンプル

### 概要

[NAVERまとめ](http://matome.naver.jp/)の注目まとめのタイトル、view数、著者、詳細リンク先URLを取得し、  
データベースに追加するスクリプトです。

### 使い方

まず、Sequel Proから、scraping\_sampleというデータベースを作成します。  
作成したら、scraping\_sample\_2016-09-29.sqlをインポートして、テーブルを作成します。  
次に、データベースへの接続部分であるdatabase.rbを必要に応じて書き換えます。  
最後に、naver.rbを実行すれば、情報を取得して、取得した情報がデータベースに追加されます。

## おまけ

Microsoft Cognitive Serviceに、[Computer Vision API](https://www.microsoft.com/cognitive-services/en-us/computer-vision-api)というAPIがあります。  
いろいろな項目をなかなか精度良く判定してくれるので、画像を扱う場合は役にた立つかと思います。  
無料版と有料版があるので、利用する場合は必要に応じて選んでください。  
こんなことができるというQiitaの記事をリンクしておきます。  
[最近の画像認識の実力～MS の最先端の研究成果 Computer Vision API を Python で使ってみた](http://qiita.com/kosfuji/items/621cbedfad0eb68b2f5d)  
[MSの画像解析サービスProject Oxfordでコスプレ ラブライブ四天王の年齢判定をプログラミングしてみる](http://qiita.com/AKB428/items/ba32bdf917037956b40f)
