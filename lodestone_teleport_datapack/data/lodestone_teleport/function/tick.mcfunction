# set cooldown for new playerslodestone_teleport
execute as @a unless score @s lodestone_teleport.cooldown matches -1.. run scoreboard players operation @s lodestone_teleport.cooldown = #lodestone_teleport lodestone_teleport.c.charge

# notify players that have recharged
execute as @a[scores={lodestone_teleport.notify=1..}] if score @s lodestone_teleport.cooldown <= #lodestone_teleport lodestone_teleport.c.charge run function lodestone_teleport:tpready

# reset cooldown for players that are not crouching/holding a lodestone compass
execute as @a if score @s lodestone_teleport.cooldown <= #lodestone_teleport lodestone_teleport.c.charge unless predicate lodestone_teleport:player/validport run scoreboard players operation @s lodestone_teleport.cooldown = #lodestone_teleport lodestone_teleport.c.charge

# if the cooldown is higher than charge time decrease by one
execute as @a if score @s lodestone_teleport.cooldown > #lodestone_teleport lodestone_teleport.c.charge run scoreboard players remove @s lodestone_teleport.cooldown 1

# if cooldown is in charge range and player is valid for teleport decrease cooldown by one
execute as @a if score @s lodestone_teleport.cooldown <= #lodestone_teleport lodestone_teleport.c.charge if predicate lodestone_teleport:player/validport run scoreboard players remove @s lodestone_teleport.cooldown 1

# Start teleportation
execute as @a[scores={lodestone_teleport.cooldown=..0,lodestone_teleport.allowed=1..,lodestone_teleport.notify=0}] at @s run function lodestone_teleport:teleport_start