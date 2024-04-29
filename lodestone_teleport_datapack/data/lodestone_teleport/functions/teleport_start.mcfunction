

#Start by summoning a dummy entity in the right dimension
execute if predicate lodestone_teleport:lodestone_compass/lodestone_nether as @s in minecraft:the_nether run summon minecraft:area_effect_cloud 0 0 0 {Tags:[TeleportHelper],Invulnerable:true,NoGravity:true,Duration:10000}
execute if predicate lodestone_teleport:lodestone_compass/lodestone_end as @s in minecraft:the_end run summon minecraft:area_effect_cloud 0 0 0 {Tags:[TeleportHelper],Invulnerable:true,NoGravity:true,Duration:10000}
execute if predicate lodestone_teleport:lodestone_compass/lodestone_overworld as @s in minecraft:overworld run summon minecraft:area_effect_cloud 0 0 0 {Tags:[TeleportHelper],Invulnerable:true,NoGravity:true,Duration:10000}

execute as @s run item modify entity @s weapon.mainhand lodestone_teleport:lodestone_compass/lodestone_lore
execute as @s run item modify entity @s weapon.mainhand lodestone_teleport:lodestone_compass/lodestone_name

execute as @s run tag @s add TeleportHelper
execute at @s run function lodestone_teleport:teleport_animation

execute as @e[type=area_effect_cloud,tag=TeleportHelper,limit=1] run function lodestone_teleport:teleport_end

tag @s remove TeleportHelper
scoreboard players set @s lodestone_teleport_notify 1