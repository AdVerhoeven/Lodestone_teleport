# set cooldown for new playerslodestone_teleport
execute as @a unless score @s lodestone_teleport_cooldown matches -1.. run scoreboard players operation @s lodestone_teleport_cooldown = #lodestone_teleport lodestone_teleport_c_charge

# notify players
execute as @a[scores={lodestone_teleport_notify=1..}] if score @s lodestone_teleport_cooldown <= #lodestone_teleport lodestone_teleport_c_charge run function lodestone_teleport:tpready

# reset cooldown for players that are not crouching/holding a lodestone compass
execute as @a if score @s lodestone_teleport_cooldown <= #lodestone_teleport lodestone_teleport_c_charge unless predicate lodestone_teleport:player/validport run scoreboard players operation @s lodestone_teleport_cooldown = #lodestone_teleport lodestone_teleport_c_charge

# if the cooldown is higher than charge time decrease by one
execute as @a if score @s lodestone_teleport_cooldown > #lodestone_teleport lodestone_teleport_c_charge run scoreboard players remove @s lodestone_teleport_cooldown 1

# if cooldown is in charge range and player is valid for teleport decrease cooldown by one
execute as @a if score @s lodestone_teleport_cooldown <= #lodestone_teleport lodestone_teleport_c_charge if predicate lodestone_teleport:player/validport run scoreboard players remove @s lodestone_teleport_cooldown 1

# Store coordinates for teleporting players
execute as @a[scores={lodestone_teleport_cooldown=..0}] run function lodestone_teleport:teleport_store_coordinates

# spawn the gateway portal
execute as @a[scores={lodestone_teleport_cooldown=..0,lodestone_teleport_ok=1..}] at @s run function lodestone_teleport:teleport_start