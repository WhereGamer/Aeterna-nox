# Установка атрибутов и инициализация
execute as @a run attribute @s minecraft:max_health base set 10
execute as @a run attribute @s minecraft:safe_fall_distance base set 2
scoreboard players add @a deathCount 0

# Сообщение на 50 смертях (с защитой от повтора через тег)
execute as @a[scores={deathCount=50}, tag=!warned_50] run tellraw @a [{"selector":"@s","color":"yellow"},{"text":" has half of the lives left!","color":"red"}]
execute as @a[scores={deathCount=50}, tag=!warned_50] run tag @s add warned_50

# Режим наблюдателя на 100 смертях
execute as @a[scores={deathCount=100..}, gamemode=!spectator] run gamemode spectator @s
execute as @a[scores={deathCount=100..}] run title @s actionbar [{"text":"You have used up all the lives you were given.","bold":true,"color":"dark_red"}]

# Ваша оригинальная механика случайного убийства
execute as @a if score @r deathCount > @s deathCount run kill @s