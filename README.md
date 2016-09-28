# 2016 10/1 スクレイピング勉強会

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

## まずやること

### Bundlerを利用してgemをインストール

今回の勉強会で使いそうなgemをまとめてインストールします。

```
$ bundle install --path .bundle
```

これでBundlerを利用してインストールできます。  
ここでインストールしたgemを使用したい場合、Rubyの実行時に、"bundle exec"をつけてください。

```
$ bundle exec ruby hoge.rb
```
