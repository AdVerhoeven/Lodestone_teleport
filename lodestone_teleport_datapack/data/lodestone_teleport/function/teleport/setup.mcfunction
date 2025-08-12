# marker summoning for a valid player holding a compass
execute unless predicate lodestone_teleport:player/has_lodestone_compass run return fail

# set the cooldown
execute store result score @s lodestone_teleport.cooldown run scoreboard players get #lodestone_teleport lodestone_teleport.c.cooldown
tag @s add lodestone_teleport.TeleportHelper

# create a marker and store required data inside a new lodestone_teleport:target component.
summon marker ~ ~ ~ {Tags: [lodestone_teleport.TeleportHelper]}
data modify entity @n[type=marker,tag=lodestone_teleport.TeleportHelper] data.lodestone_teleport:target.playerid set from entity @s UUID
data modify entity @n[type=marker,tag=lodestone_teleport.TeleportHelper] data.lodestone_teleport:target.yaw set from entity @s Rotation[0]
data modify entity @n[type=marker,tag=lodestone_teleport.TeleportHelper] data.lodestone_teleport:target.pitch set from entity @s Rotation[1]
data modify entity @n[type=marker,tag=lodestone_teleport.TeleportHelper] data.lodestone_teleport:target.dimension set from entity @s SelectedItem.components.minecraft:lodestone_tracker.target.dimension
execute store result entity @n[type=marker,tag=lodestone_teleport.TeleportHelper] data.lodestone_teleport:target.x double 1 run data get entity @s SelectedItem.components.minecraft:lodestone_tracker.target.pos[0]
execute store result entity @n[type=marker,tag=lodestone_teleport.TeleportHelper] data.lodestone_teleport:target.y double 1 run data get entity @s SelectedItem.components.minecraft:lodestone_tracker.target.pos[1]
execute store result entity @n[type=marker,tag=lodestone_teleport.TeleportHelper] data.lodestone_teleport:target.z double 1 run data get entity @s SelectedItem.components.minecraft:lodestone_tracker.target.pos[2]

# execute macro function using the lodestone_teleport:target component
execute as @n[type=marker,tag=lodestone_teleport.TeleportHelper] run function lodestone_teleport:teleport/execute_with with entity @n[type=marker,tag=lodestone_teleport.TeleportHelper] data.lodestone_teleport:target
tag @s remove lodestone_teleport.TeleportHelper
