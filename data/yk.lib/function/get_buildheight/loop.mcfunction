# yk.lib:get_buildheight/loop

## 初期化

data modify storage yk.lib:global get_buildheight.Fishable set value 0n

## 釣りができたかを保存

execute store success storage yk.lib:global get_buildheight.Fishable byte 1.0 run \
    loot spawn ~ ~ ~ fish yk.lib:empty ~ ~-16 ~

## Maxをまだとってなければmaxに入れる

execute if data storage yk.lib:global get_buildheight{getMax:0b} if data storage yk.lib:global get_buildheight{Success:1b} \
    summon marker run \
        function yk.lib:get_buildheight/get_max

## Maxあとに失敗したら下限なのでminに入れる

execute if data storage yk.lib:global get_buildheight{getMax:1b} if data storage yk.lib:global get_buildheight{Success:0b} run \
    return run \
        execute summon marker run \
            function yk.lib:get_buildheight/get_min

## 下行きすぎたら失敗にする

execute if predicate {condition:"location_check",predicate:{position:{y:{max:-2033}}}} run \
    return fail

## 位置を下げてループ(高度上限は16刻み)

execute positioned ~ ~-16.0 ~ run \
    function yk.lib:get_buildheight/loop
