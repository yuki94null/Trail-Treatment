# yk.lib:get_worldspawn/in_the_end

## フォースロードしてアマスタを現世に持ってくる(もともとロードされてたら戻せるようにしておく)

execute store success storage yk.lib:global get_worldspawn.AlreadyForceloaded byte 1.0 run forceload query 100 0
forceload add 100 0

## 帰還ポータル設置

setblock ~ ~ ~ end_portal strict

## アマスタ出して返す

summon armor_stand ~ ~ ~ {Tags:[yk.lib.get_worldspawn.marker],Invisible:true,Small:true}

## scheduleで1tick後に実行

schedule function yk.lib:get_worldspawn/after 3t append
