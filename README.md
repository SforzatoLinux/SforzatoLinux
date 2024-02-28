# kiwiの準備
下記を実行し必要な環境を準備する。
```
sudo zypper install python3-kiwi
sudo zypper install python3-xmltodict
git clone https://github.com/OSInside/kiwi.git
git clone https://github.com/SforzatoLinux/iso-maker/
```

# kiwi設定ファイル

パスワードは変更してビルドして下さい

- test-gui-01：./kiwi/build-tests/x86/tumbleweed/test-image-diskを元にkiwiファイルを修正
- test-gui-02：gnomeデスクトップ
- test-gui-03：gnomeデスクトップ LIVE
- test-gui-04：SforzatoLinux開発環境

## ビルド方法
```
sudo kiwi-ng system build --description iso-maker/test-gui-04 --target-dir iso-test-04
```
ディレクトリ名は、ビルドしたいkiwiファイルの入っている名称に変更して下さい。

## Mekefileを用いたビルド方法
```
cd iso-maker/test-gui-04/
make
```
(注)test-gui-04でしか使えません!
