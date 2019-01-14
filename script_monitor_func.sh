#!/bin/bash

#-----------------------------------------------------
# シェルスクリプト名：script_monitor_func.sh
# 概要：使いたいシェルで読み込まれて、処理時間を測る
# 引数：なし
#-----------------------------------------------------
SCRIPT_MOITOR_SHELL_NAME="ScriptMonitor"
SCRIPT_MOITOR_DESCRIPTION="速度計算をした詳細等を記載する箇所"
SCRIPT_MOITOR_LOG_PATH=$(cd $(dirname $0); pwd)
SCRIPT_MOITOR_LOG_NAME="LOG("${SCRIPT_MOITOR_SHELL_NAME}").log"

#-----------------------------------------------------
# ログの初期化(必須ではない。)
# 引数1：シェル名
# 引数2：内容
# 引数3：保存場所
#-----------------------------------------------------
log_manual(){
    SCRIPT_MOITOR_SHELL_NAME=$1
    SCRIPT_MOITOR_DESCRIPTION=$2
    SCRIPT_MOITOR_LOG_PATH=$3
    SCRIPT_MOITOR_LOG_NAME=log_name ${SCRIPT_MOITOR_SHELL_NAME}
}

#-----------------------------------------------------
# 開始時間の関数
#-----------------------------------------------------
start_monitor(){
    echo "処理内容 >>> "${SCRIPT_MOITOR_DESCRIPTION} >> ${SCRIPT_MOITOR_LOG_PATH}/${SCRIPT_MOITOR_LOG_NAME}
    SECONDS=0
    echo "計測開始..." >> ${SCRIPT_MOITOR_LOG_PATH}/${SCRIPT_MOITOR_LOG_NAME}
}

#-----------------------------------------------------
# 経過時間の関数
#-----------------------------------------------------
elapsed_time(){
    echo "観測内容 >>> "$1 >> ${SCRIPT_MOITOR_LOG_PATH}/${SCRIPT_MOITOR_LOG_NAME}
    echo "経過時間 >>> "${SECONDS} >> ${SCRIPT_MOITOR_LOG_PATH}/${SCRIPT_MOITOR_LOG_NAME}
}

#-----------------------------------------------------
# 終了時間の関数
#-----------------------------------------------------
end_monitor(){
    echo "速度結果 >>> "${SECONDS}>> ${SCRIPT_MOITOR_LOG_PATH}/${SCRIPT_MOITOR_LOG_NAME}
    echo "...計測終了" >> ${SCRIPT_MOITOR_LOG_PATH}/${SCRIPT_MOITOR_LOG_NAME}
    echo "" >> ${SCRIPT_MOITOR_LOG_PATH}/${SCRIPT_MOITOR_LOG_NAME}
}

#-----------------------------------------------------
# ログ名の作成
# 引数：シェル名
#-----------------------------------------------------
log_name(){
    local arg_1="monitoring"
    if [ $# -eq 1] ;then
        arg_1=$1
    fi

    local LOG_NAME_HEAD="LOG("
    local LOG_NAME_END=").log"
    local LOG_NAME=LOG_NAME_HEAD + arg_1 + LOG_NAME_END

    return LOG_NAME
}