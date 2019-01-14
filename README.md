# shellscript-time-monitor
### 概要
シェルスクリプトの実行時間が知りたい。（bashのみ）
### スクリプトを細かく計測する関数
- 名前：script_monitor_func.sh
- 使い方：対象スクリプトに読み込ませて使う。
### スクリプトの全体的な時間を計測するスクリプト
- 名前：script_monitor.sh
- 使い方：上記スクリプトの第一引数に対象スクリプトを指定して実行する。
- 注意事項：実行権限エラーが出る場合は権限を付与すること。
