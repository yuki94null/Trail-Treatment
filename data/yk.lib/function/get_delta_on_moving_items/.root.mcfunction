# yk.lib:get_delta_on_moving_items/.root

#
#   storage yk.lib:inputs SendItems[]: List
#   storage yk.lib:inputs RecieveItems[]: List
#   storage yk.lib:inputs MaxSendCount = 1: int
#   

## return

execute unless data storage yk.lib:inputs SendItems run return run say NotEnoughInput SendItems
execute unless data storage yk.lib:inputs RecieveItems run return run say NotEnoughInput RecieveItems

execute store result score $MaxSendCount yk.lib.global run data get storage yk.lib:inputs MaxSendCount

execute if score $MaxSendCount yk.lib.global matches 0 run return run say MaxSendCount が 0

## init

data modify storage yk.lib:outputs DeltaSendItems set from storage yk.lib:inputs SendItems
data modify storage yk.lib:outputs DeltaRecieveItems set from storage yk.lib:inputs RecieveItems

data remove storage yk.lib:global MaxStackList

scoreboard players reset #Success yk.lib.global

execute store result storage yk.lib:global SendIndex int 1.0 run scoreboard players set $SendIndex yk.lib.global 0
execute store result score $MaxSendIndex yk.lib.global run data get storage yk.lib:inputs SendItems

execute store result storage yk.lib:global RecieveIndex int 1.0 run scoreboard players set $RecieveIndex yk.lib.global 0
execute store result score $MaxRecieveIndex yk.lib.global run data get storage yk.lib:inputs RecieveItems

## 

function yk.lib:get_delta_on_moving_items/loop with storage yk.lib:global



## お片付け

# data remove storage yk.lib:inputs SendItems
# data remove storage yk.lib:inputs RecieveItems

data modify storage yk.lib:inputs MaxSendCount set value 1