data remove storage yk.lib:global tmp.2
$data modify storage yk.lib:global tmp.2 set from storage yk.lib:inputs RecieveItems[{Slot:$(RecieveIndex)b}]

$data modify storage yk.lib:global tmp.Slot set value $(RecieveIndex)b

data modify storage yk.lib:global tmp.Count set value 0
data modify storage yk.lib:global tmp.Count set from storage yk.lib:global tmp.2.count

data remove storage yk.lib:global tmp.2.count
data remove storage yk.lib:global tmp.2.Slot

data modify storage yk.lib:global tmp.1 set from storage yk.lib:global tmp.0

tellraw @a [{text:"    tmp.2: "},{nbt:"tmp.Slot","storage":"yk.lib:global"},{nbt:"tmp.2","storage":"yk.lib:global"}]

## 完全一致のデータは置き換えられないことを利用して、一致の是非を取る

execute store success storage yk.lib:global EqualItems byte 1.0 run data modify storage yk.lib:global tmp.1 set from storage yk.lib:global tmp.2

execute unless data storage yk.lib:global tmp.2 run function yk.lib:get_delta_on_moving_items/empty with storage yk.lib:global

##

execute if data storage yk.lib:global tmp.2 if data storage yk.lib:global {EqualItems:0b} run function yk.lib:get_delta_on_moving_items/fail with storage yk.lib:global

#
execute if score $MaxSendCount yk.lib.global matches ..0 run return run tellraw @a [{text:"Send数上限"}]

execute store result storage yk.lib:global RecieveIndex int 1.0 run scoreboard players add $RecieveIndex yk.lib.global 1

execute if score $RecieveIndex yk.lib.global >= $MaxRecieveIndex yk.lib.global run return run say AlreadyAllSlot

function yk.lib:get_delta_on_moving_items/loop1 with storage yk.lib:global