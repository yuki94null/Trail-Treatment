# yk.lib:find_aimtarget/.root

## init

tag @e remove yk.lib.find_aimtarget.min

## 対象を絞る (yk.lib.find_aimtarget.exceptionが付いたエンティティは除外される)

### 能あるエンティティに絞る

execute as @e[tag=!yk.lib.find_aimtarget.exception,nbt={Brain:{}},type=armor_stand] \
    positioned as @n facing entity @s feet positioned ^ ^ ^1.0 run \
        function yk.lib:find_aimtarget/summon_marker with entity @s

## プレイヤーの1.0先から一番近いやつにタグをつける

execute anchored feet positioned ^ ^ ^ \
    positioned ^ ^ ^1.0 \
    as @n[tag=yk.lib.find_aimtarget.marker] run \
        function yk.lib:find_aimtarget/find_specific with entity @s data."yk.lib"

## タグ外す

kill @e[tag=yk.lib.find_aimtarget.marker]
