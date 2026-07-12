# yk.lib:find_aimtarget/summon_marker

## 位置出す

tag @s add yk.lib.find_aimtarget

summon marker ~ ~ ~ {Tags:[yk.lib.find_aimtarget.marker,yk.lib.find_aimtarget]}

scoreboard players add @e[tag=yk.lib.find_aimtarget] yk.lib.global 1
