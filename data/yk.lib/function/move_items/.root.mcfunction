# yk.lib:move_items/.rootglobal

#
#   storage yk.lib:inputs SendItems[]: List
#   storage yk.lib:inputs RecieveItems[]: List
#   storage yk.lib:inputs MaxSendCount = 1: int
#   storage yk.lib:inputs RecieveContainerMaxSlot: int

## return

execute unless data storage yk.lib:inputs SendItems run return run say NotEnoughInput SendItems
execute unless data storage yk.lib:inputs RecieveItems run return run say NotEnoughInput RecieveItems
execute unless data storage yk.lib:inputs MaxSendCount run return run say NotEnoughInput MaxSendCount
execute unless data storage yk.lib:inputs RecieveContainerMaxSlot run return run say NotEnoughInput RecieveContainerMaxSlot

execute store result score $RecieveContainerMaxSlot yk.lib.global run data get storage yk.lib:inputs RecieveContainerMaxSlot
execute if score $RecieveContainerMaxSlot yk.lib.global matches ..0 run return run say RecieveContainerMaxSlot が 0

execute store result score $MaxSendCount yk.lib.global run data get storage yk.lib:inputs MaxSendCount
execute if score $MaxSendCount yk.lib.global matches ..0 run return run say MaxSendCount が 0

## init

data modify storage yk.lib:outputs SendItems set from storage yk.lib:inputs SendItems
data modify storage yk.lib:outputs RecieveItems set from storage yk.lib:inputs RecieveItems

data remove storage yk.lib:global move_items.MaxStackList

execute store result storage yk.lib:global move_items.SendIndex int 1.0 run scoreboard players set $SendIndex yk.lib.global 0
execute store result score $MaxSendIndex yk.lib.global run data get storage yk.lib:inputs SendItems

execute store result storage yk.lib:global move_items.RecieveIndex int 1.0 run scoreboard players set $RecieveIndex yk.lib.global 0
execute store result score $MaxRecieveIndex yk.lib.global run data get storage yk.lib:inputs RecieveContainerMaxSlot

## 

function yk.lib:move_items/send_loop with storage yk.lib:global

## お片付け

# data remove storage yk.lib:inputs SendItems
# data remove storage yk.lib:inputs RecieveItems

data modify storage yk.lib:inputs MaxSendCount set value 1
data modify storage yk.lib:inputs RecieveContainerMaxSlot set value 26