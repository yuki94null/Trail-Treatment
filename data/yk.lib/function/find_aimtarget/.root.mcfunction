# yk.lib:find_aimtarget/.root

## init

tag @e remove yk.lib.find_aimtarget.min
scoreboard players reset @e yk.lib.global

## 対象を絞る

execute anchored feet positioned ^ ^ ^ as @e[distance=0.01..] \
    positioned ^ ^ ^-100000 if entity @s[distance=..100050] positioned ^ ^ ^100000 \
    rotated ~30 ~ positioned ^100000 ^ ^ if entity @s[distance=..100000] positioned ^-100000 ^ ^ rotated ~-30 ~ \
    rotated ~-30 ~ positioned ^-100000 ^ ^ if entity @s[distance=..100000] positioned ^100000 ^ ^ rotated ~30 ~ \
    positioned as @n facing entity @s feet positioned ^ ^ ^1.0 run \
        function yk.lib:find_aimtarget/summon_marker

## プレイヤーの1.0先から一番近いやつにタグをつける

execute anchored feet positioned ^ ^ ^ \
    positioned ^ ^ ^1.0 \
    as @e[tag=yk.lib.find_aimtarget,tag=!yk.lib.find_aimtarget.marker] \
    if score @s yk.lib.global = @n[tag=yk.lib.find_aimtarget.marker] yk.lib.global run \
        tag @s add yk.lib.find_aimtarget.min 

## タグ外す

kill @e[tag=yk.lib.find_aimtarget.marker]
tag @e remove yk.lib.find_aimtarget
