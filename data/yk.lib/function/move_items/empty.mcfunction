tellraw @a [{text:"    ="}]


data modify storage yk.lib:inputs Item set from storage yk.lib:global move_items.CurrentSendItem
data modify storage yk.lib:global move_items.tmp.3 set from storage yk.lib:global move_items.CurrentSendItem

$data modify storage yk.lib:global move_items.tmp.3.Slot set value $(RecieveIndex)b

function yk.lib:get_maxstacksize/.root

## スタックがいっぱいだったら帰る

execute store result score $MaxStackSize yk.lib.global run data get storage yk.lib:outputs MaxStackSize

## 入れる数をclamp

execute store result score $Tmp yk.lib.global store result score $SendCount yk.lib.global run data get storage yk.lib:global move_items.CurrentSendItem.count

execute if score $Tmp yk.lib.global > $MaxSendCount yk.lib.global run scoreboard players operation $Tmp yk.lib.global = $MaxSendCount yk.lib.global
execute if score $Tmp yk.lib.global > $MaxStackSize yk.lib.global run scoreboard players operation $Tmp yk.lib.global = $MaxStackSize yk.lib.global

## 入れられる数を減らす

scoreboard players operation $MaxSendCount yk.lib.global -= $Tmp yk.lib.global

## Send側マックス入れるとき{"id":"air"}

$execute if score $Tmp yk.lib.global >= $SendCount yk.lib.global run \
    data modify storage yk.lib:outputs DeltaSendItems[{Slot:$(SendIndex)b}].id set value "minecraft:air"

## Send Countを減らす

$execute store result storage yk.lib:outputs DeltaSendItems[{Slot:$(SendIndex)b}].count int 1.0 run scoreboard players operation $SendCount yk.lib.global -= $Tmp yk.lib.global

## Recieve側増やす

execute store result storage yk.lib:global move_items.tmp.3.count int 1.0 run scoreboard players get $Tmp yk.lib.global

tellraw @a [{nbt:"tmp.3",storage:"yk.lib:global"}]

$execute store success storage yk.lib:global move_items.OverRided byte 1.0 run data modify storage yk.lib:outputs DeltaRecieveItems[{Slot:$(RecieveIndex)b}] set from storage yk.lib:global move_items.tmp.3

execute if data storage yk.lib:global move_items{OverRided:0b} run data modify storage yk.lib:outputs DeltaRecieveItems append from storage yk.lib:global move_items.tmp.3

tellraw @a [{text:"空に入れたよ"}]
