# yk.lib:move_items/recieve_loop

##

$data modify storage yk.lib:global move_items.CurrentRecieveItem set from storage yk.lib:inputs RecieveItems[$(RecieveIndex)]

data modify storage yk.lib:global move_items.compare.1.Item set from storage yk.lib:global move_items.CurrentRecieveItem 

data modify storage yk.lib:global move_items.compare.1.Item.Count set value 0
data modify storage yk.lib:global move_items.compare.1.Item.Count set from storage yk.lib:global move_items.compare.1.Item.count

data remove storage yk.lib:global move_items.compare.1.Item.count
data remove storage yk.lib:global move_items.compare.1.Item.Slot

tellraw @a [{text:"    compare.2.Item: "},{nbt:"compare.Slot","storage":"yk.lib:global"},{nbt:"compare.2.Item","storage":"yk.lib:global"}]

## 完全一致のデータは置き換えられないことを利用して、一致の是非を取る

execute store success storage yk.lib:global move_items.EqualItems byte 1.0 run data modify storage yk.lib:global move_items.compare.1.Item set from storage yk.lib:global move_items.compare.1.Item

execute unless data storage yk.lib:global move_items.compare.2.Item run function yk.lib:move_items/empty with storage yk.lib:global

##

execute if data storage yk.lib:global move_items.compare.2.Item if data storage yk.lib:global move_items{EqualItems:0b} run function yk.lib:move_items/fail with storage yk.lib:global

#
execute if score $MaxSendCount yk.lib.global matches ..0 run return run tellraw @a [{text:"Send数上限"}]

execute store result storage yk.lib:global move_items.RecieveIndex int 1.0 run scoreboard players add $RecieveIndex yk.lib.global 1

execute if score $RecieveIndex yk.lib.global >= $MaxRecieveIndex yk.lib.global run return run say AlreadyAllSlot

function yk.lib:move_items/recieve_loop with storage yk.lib:global