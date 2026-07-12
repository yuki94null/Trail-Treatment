
$data modify storage yk.lib:global CurrentItem set from storage yk.lib:inputs SendItems[$(SendIndex)]
data modify storage yk.lib:global tmp.0 set from storage yk.lib:global CurrentItem 
data remove storage yk.lib:global tmp.0.count
data remove storage yk.lib:global tmp.0.Slot


tellraw @a [{score:{name:"$SendIndex",objective:"yk.lib.global"}},{text:" "},{score:{name:"$MaxSendIndex",objective:"yk.lib.global"}}]

tellraw @a [{text:"tmp.0: "},{nbt:"tmp.0","storage":"yk.lib:global"}]

execute store result storage yk.lib:global RecieveIndex int 1.0 run scoreboard players set $RecieveIndex yk.lib.global 0
execute store result score $MaxRecieveIndex yk.lib.global run data get storage yk.lib:inputs RecieveItems

function yk.lib:get_delta_on_moving_items/loop1 with storage yk.lib:global


execute if score $MaxSendCount yk.lib.global matches ..0 run return run tellraw @a [{text:"Send数上限"}]

execute store result storage yk.lib:global SendIndex int 1.0 run scoreboard players add $SendIndex yk.lib.global 1

execute if score $SendIndex yk.lib.global >= $MaxSendIndex yk.lib.global run return run say AlreadyAllSlot

function yk.lib:get_delta_on_moving_items/loop with storage yk.lib:global