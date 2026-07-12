# yk.lib:get_buildheight/.root

## Init

data modify storage yk.lib:global get_buildheight.Fishable set value 0b
data modify storage yk.lib:global get_buildheight.getMax set value 0b

## ループ開始

execute positioned 0 2032.0 0 run function yk.lib:get_buildheight/loop

## データ消しとく

data remove storage yk.lib:global get_buildheight
