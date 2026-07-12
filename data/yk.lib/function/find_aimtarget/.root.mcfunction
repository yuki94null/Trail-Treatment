# yk.lib:find_aimtarget/.root

## init

tag @e remove yk.lib.find_aimtarget.min

## 対象を絞る (yk.lib.find_aimtarget.exceptionが付いたエンティティは除外される)

execute as @e[tag=!yk.lib.find_aimtarget.exception,nbt={Brain:{}}] \
    positioned as @n facing entity @s feet positioned ^ ^ ^1.0 run \
        function yk.lib:find_aimtarget/summon_marker

## プレイヤーの1.0先から一番近いやつにタグをつける

execute anchored feet positioned ^ ^ ^ \
    positioned ^ ^ ^1.0 \
    at @n[tag=yk.lib.find_aimtarget.marker] as @e[tag=yk.lib.find_aimtarget,tag=!yk.lib.find_aimtarget.marker] \
        if score @s yk.lib.global = @n[tag=yk.lib.find_aimtarget.marker] yk.lib.global run \
        tag @s add yk.lib.find_aimtarget.min

## タグ外す

kill @e[tag=yk.lib.find_aimtarget.marker]
scoreboard players reset @e yk.lib.global
