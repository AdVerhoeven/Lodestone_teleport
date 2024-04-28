#set pos of dummy cloud to scoreboard values
execute store result entity @s Pos[0] double 1 run scoreboard players get @a[tag=TeleportHelper,limit=1] lodestone_teleport_X
execute store result entity @s Pos[1] double 1 run scoreboard players get @a[tag=TeleportHelper,limit=1] lodestone_teleport_Y
execute store result entity @s Pos[2] double 1 run scoreboard players get @a[tag=TeleportHelper,limit=1] lodestone_teleport_Z

#Place the entity a little bit above the midpoint of said block
execute at @s run tp @s ~0.5 ~0.1 ~0.5

execute if score #lodestone_teleport lodestone_teleport_c_notify_chunkload matches 1.. run tellraw @a[tag=TeleportHelper] [{"text": "[lodestone_teleport] ","color": "gold"},{"text": "Force loading target chunk!","color": "red"}]
 

execute if entity @s in the_nether run execute at @s in the_nether run forceload add ~ ~
execute if entity @s in the_end run execute at @s in the_end run forceload add ~ ~
execute if entity @s in overworld run execute at @s in overworld run forceload add ~ ~

execute if score #lodestone_teleport lodestone_teleport_c_notify_chunkload matches 1.. run tellraw @a[tag=TeleportHelper] [{"text": "[lodestone_teleport] ","color": "gold"},{"text": "Chunk loading complete!","color": "green"}]
execute run tellraw @a[tag=TeleportHelper] [{"translate": "lodestone_teleport.title","fallback": "[lodestone_teleport] ", "color": "gold"},{"translate":"lodestone_teleport.location_check","fallback": "Checking location","color": "yellow"}]

#check location and notify if it is blocked. 
#Tip: do not use predicate directly, 
#it is easier to tell the context by calling the predicate through the desired entity
execute unless entity @s[predicate=lodestone_teleport:safe_teleport] run tellraw @a[tag=TeleportHelper] [{"translate": "lodestone_teleport.title","fallback": "[lodestone_teleport] ", "color": "gold"},{"translate":"lodestone_teleport.location_unsafe","fallback": "Location is unsafe!","color": "red"}]
execute unless entity @s[predicate=lodestone_teleport:safe_teleport] run playsound entity.allay.hurt player @a[tag=TeleportHelper] ~ ~ ~ 1 1 1

#Set rotation of dummy entity to the player rotation (player will not change its rotation)
execute at @s rotated as @a[tag=TeleportHelper] run tp ~ ~ ~

#teleport the player to exact location/facing
execute if entity @s[predicate=lodestone_teleport:safe_teleport] run tp @a[tag=TeleportHelper,limit=1] @s

#update cooldown
execute store result score @a[tag=TeleportHelper,limit=1] lodestone_teleport_cooldown run scoreboard players get #lodestone_teleport lodestone_teleport_c_cooldown
return 1

execute run forceload remove ~ ~

#destroy dummy effect
kill @s