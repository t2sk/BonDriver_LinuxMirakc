# BonDriver_LinuxMirakc
Linux の EDCB で mirakc に接続するための BonDriver です。Mirakurunでは接続テストしていないので動くかわかりません。


以下をベースにLinuxで動くように移植しました。作者さまに感謝いたします。

・[BonDriver_mirakc](https://github.com/tkmsst/BonDriver_mirakc)

・[BonDriver_LinuxPTX](https://github.com/nns779/BonDriver_LinuxPTX)


## 設定ファイルについて

基本的には[BonDriver_mirakc](https://github.com/tkmsst/BonDriver_mirakc)のままですが、Unixドメインソケットに対応しています。
同サーバ内であれば利用できます。

以下のように設定ください。
```
SERVER_TYPE="unix"
SERVER_SOCKPATH="/var/run/mirakc.sock"
```

## ビルド方法

JSONの解析のために picojson が必要です。
include/picojson 配下に picojson のgitのツリーそのまま入れてください。

clone で行う方はする方は
> $ git clone "URL" ***--recurse-submodules***

とすることで picojson 含めてcloneされます。
ビルドは CMake でも実施できます。C++23 と最適化 (-O3) を利用します。
```sh
$ cmake -S . -B build
$ cmake --build build
```
clang++ を使う場合は次のようにコンパイラを指定してください。
```sh
$ cmake -S . -B build -DCMAKE_CXX_COMPILER=clang++
$ cmake --build build
```
従来の Makefile も C++23 と -O3 でビルドされます。次の通りです。
```sh
$ make
```
clang++ を利用する場合は環境変数を指定してください。
```sh
$ make USE_CLANG=1
```

## License
This software is released under the MIT License, see LICENSE.
