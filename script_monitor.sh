#!/bin/bash

#-----------------------------------------------------
# シェルスクリプト名：script_monitor.sh
# 概要：使いたいシェルで読み込まれて、処理時間を測る
# 引数：なし
#-----------------------------------------------------

### モニター関数の読み込み
. script_monitor_func.sh

### 引数の個数確認
if [ $# -eq 1 ] ;then
    arg_1=$1
else
    echo "計測したいシェル名を第一引数にしてください。"
    exit 1
fi

### 引数であるファイルの存在確認
if [ ! -e ${SCRIPT_MOITOR_LOG_PATH}/${arg_1} ];then
    echo "ファイルを発見できませんでした。"
    echo ${SCRIPT_MOITOR_LOG_PATH}/${arg_1}
    exit 1
fi

### 初期化
SCRIPT_MOITOR_SHELL_NAME=${arg_1}
SCRIPT_MOITOR_DESCRIPTION="シェルスクリプト全体の速度計測"
SCRIPT_MOITOR_LOG_NAME="LOG("${SCRIPT_MOITOR_SHELL_NAME}").log"

### 計測開始
start_monitor

### 
eval ${SCRIPT_MOITOR_LOG_PATH}/${arg_1}

### 計測終了
end_monitor
