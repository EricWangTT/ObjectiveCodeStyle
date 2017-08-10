
#
# WangKang wangkang@p1.com
#
# 1. Download [clang-format 3.5.2](http://llvm.org/releases/3.5.2/clang+llvm-3.5.2-x86_64-apple-darwin.tar.xz)
# 2. Copy clang-format into folder `/usr/local/bin/`
# 3. Edit `~/.profile`, insert a new line `export PATH=/usr/local/bin:$PATH`
# 4. `. ~/.profile`
# 5. Copy [pre-commit](https://github.com/augmn/tios/wiki/Content-of-pre-commit) into folder `.gits/hooks/`
# 6. `chmod +x pre-commit`
# 7. Change `.clang-format` if you want to change the style.

# 初始化临时文件夹
Pack_Path=$1
Format_Path=$Pack_Path"/format_tmp"
mkdir $Format_Path

# 下载clang-format
wget http://llvm.org/releases/3.5.2/clang+llvm-3.5.2-x86_64-apple-darwin.tar.xz -P $Format_Path
tar -xf $Format_Path'/clang+llvm-3.5.2-x86_64-apple-darwin.tar.xz' -C $Format_Path

# 移动clang-format到/usr/local/bin/
Clang_Path=$Format_Path"/clang+llvm-3.5.2-x86_64-apple-darwin/bin/clang-format"
mv $Clang_Path /usr/local/bin/

# 修改~/.profile
echo 'PATH=/usr/local/bin:$PATH' >> ~/.profile
source ~/.profile

# 下载pre-commit
Git_Hooks_Path=$Pack_Path"/.git/hooks/"
Git_Hooks_Path_Precommit=$Format_Path"/pre-commit"
wget https://github.com/EricWangTT/ObjectiveCodeStyle/blob/master/pre-commit -P $Format_Path

# 移动pre-commit
mv $Git_Hooks_Path_Precommit $Git_Hooks_Path
chmod +x $Git_Hooks_Path'/pre-commit'

# 清除临时文件
rm -rf $Format_Path
