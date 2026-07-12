# yk.lib:move_items/send_loop

## SendItemを一時保存

$data modify storage yk.lib:global move_items.CurrentSendItem set from storage yk.lib:inputs SendItems[$(SendIndex)]

### id とcomponentsだけのやつ (比較用)

data modify storage yk.lib:global move_items.compare.0.Item set from storage yk.lib:global move_items.CurrentSendItem 
data remove storage yk.lib:global move_items.compare.0.Item.count
data remove storage yk.lib:global move_items.compare.0.Item.Slot


tellraw @a [{score:{name:"$SendIndex",objective:"yk.lib.global"}},{text:" "},{score:{name:"$MaxSendIndex",objective:"yk.lib.global"}}]

tellraw @a [{text:"compare.0: "},{nbt:"compare.0","storage":"yk.lib:global"}]

## 参照する送信先のスロットをリセット

execute store result storage yk.lib:global move_items.RecieveIndex int 1.0 run scoreboard players set $RecieveIndex yk.lib.global 0
execute store result score $MaxRecieveIndex yk.lib.global run data get storage yk.lib:inputs RecieveItems

function yk.lib:move_items/recieve_loop with storage yk.lib:global

## もう遅れなければリターン

execute if score $MaxSendCount yk.lib.global matches ..0 run return run tellraw @a [{text:"Send数上限"}]

## 次のやつにする

execute store result storage yk.lib:global move_items.SendIndex int 1.0 run scoreboard players add $SendIndex yk.lib.global 1

## 次のやつがなければ終わる

execute if score $SendIndex yk.lib.global >= $MaxSendIndex yk.lib.global run return run say AlreadyAllSlot

## 次のやつ

function yk.lib:move_items/send_loop with storage yk.lib:global
