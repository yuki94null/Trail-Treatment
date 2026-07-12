# yk.lib:get_buildheight/get_max

## フラグ立てる

data modify storage yk.lib:global get_buildheight.getMax set value 1b

## Pos入れて死ぬ

data modify storage yk.lib:outputs BuildHeight.max set from entity @s Pos[1]
kill @s