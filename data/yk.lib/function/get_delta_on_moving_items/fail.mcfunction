tellraw @a [{text:"    ="}]

data modify storage yk.lib:inputs Item set from storage yk.lib:global tmp.2

function yk.lib:get_maxstacksize/.root

## スタックがいっぱいだったら帰る

execute store result score $MaxStackSize yk.lib.global run data get storage yk.lib:outputs MaxStackSize
execute store result score $Count yk.lib.global run data get storage yk.lib:global tmp.Count

scoreboard players operation $MaxStackSize yk.lib.global -= $Count yk.lib.global

execute if score $MaxStackSize yk.lib.global matches ..0 run return run tellraw @a [{text:"余裕ないよ"}]

## 入れる数をclamp

execute store result score $Tmp yk.lib.global store result score $SendCount yk.lib.global run data get storage yk.lib:global CurrentItem.count

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

$execute store result storage yk.lib:outputs DeltaRecieveItems[{Slot:$(RecieveIndex)b}].count int 1.0 run scoreboard players operation $Count yk.lib.global += $Tmp yk.lib.global

tellraw @a [{text:"余裕あるよ"}]
