#Start by summoning a dummy entity in the right dimension
execute if predicate lodestone_teleport:lodestone_compass/lodestone_nether as @s in minecraft:the_nether run summon minecraft:area_effect_cloud 0 0 0 {Tags:[TeleportHelper],Invulnerable:true,NoGravity:true}
execute if predicate lodestone_teleport:lodestone_compass/lodestone_end as @s in minecraft:the_end run summon minecraft:area_effect_cloud 0 0 0 {Tags:[TeleportHelper],Invulnerable:true,NoGravity:true}
execute if predicate lodestone_teleport:lodestone_compass/lodestone_overworld as @s in minecraft:overworld run summon minecraft:area_effect_cloud 0 0 0 {Tags:[TeleportHelper],Invulnerable:true,NoGravity:true}

execute as @s run item modify entity @s weapon.mainhand lodestone_teleport:lodestone_compass/lodestone_lore
execute as @s run item modify entity @s weapon.mainhand lodestone_teleport:lodestone_compass/lodestone_name

execute as @s run tag @s add TeleportHelper
execute if score #lodestone_teleport lodestone_teleport_c_animation matches 1 as @s run function lodestone_teleport:teleport_animation
playsound block.beacon.activate ambient @p ~ ~ ~ 1 1 1

execute as @e[type=area_effect_cloud,tag=TeleportHelper,limit=1] run function lodestone_teleport:teleport_end

tag @s remove TeleportHelper
scoreboard players set @s lodestone_teleport_notify 1

advancement grant @s only global:lodestone_teleport/has_teleported