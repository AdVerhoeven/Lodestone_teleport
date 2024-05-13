# marker summoning for a valid player holding a compass
execute unless predicate lodestone_teleport:player/has_lodestone_compass run return fail

# set the cooldown
execute store result score @s lodestone_teleport_cooldown run scoreboard players get #lodestone_teleport lodestone_teleport_c_cooldown
tag @s add TeleportHelper
summon marker ~ ~ ~ {Tags:[TeleportHelper]}
data modify entity @e[type=marker,tag=TeleportHelper,sort=nearest,limit=1] data.target.playerid set from entity @s UUID
data modify entity @e[type=marker,tag=TeleportHelper,sort=nearest,limit=1] data.target.yaw set from entity @s Rotation[0]
data modify entity @e[type=marker,tag=TeleportHelper,sort=nearest,limit=1] data.target.pitch set from entity @s Rotation[1]
data modify entity @e[type=marker,tag=TeleportHelper,sort=nearest,limit=1] data.target.dimension set from entity @s SelectedItem.components.minecraft:lodestone_tracker.target.dimension
execute store result entity @e[type=marker,tag=TeleportHelper,sort=nearest,limit=1] data.target.x double 1 run data get entity @s SelectedItem.components.minecraft:lodestone_tracker.target.pos[0]
execute store result entity @e[type=marker,tag=TeleportHelper,sort=nearest,limit=1] data.target.y double 1 run data get entity @s SelectedItem.components.minecraft:lodestone_tracker.target.pos[1]
execute store result entity @e[type=marker,tag=TeleportHelper,sort=nearest,limit=1] data.target.z double 1 run data get entity @s SelectedItem.components.minecraft:lodestone_tracker.target.pos[2]

execute as @e[type=marker,tag=TeleportHelper,sort=nearest,limit=1] run function lodestone_teleport:teleport_execute_with with entity @e[type=marker,tag=TeleportHelper,sort=nearest,limit=1] data.target
tag @s remove TeleportHelper