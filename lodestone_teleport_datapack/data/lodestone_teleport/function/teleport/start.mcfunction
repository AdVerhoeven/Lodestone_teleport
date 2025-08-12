tag @s add lodestone_teleport.TeleportHelper

# Call macro function for chunkloading and location checking.
function lodestone_teleport:teleport/setup

# Modify compass lore and name (in case they have not been set when the compass was used on a lodestone)
item modify entity @s weapon.mainhand lodestone_teleport:lodestone_compass/lodestone_full

# Display teleport animation if configured.
execute if score #lodestone_teleport lodestone_teleport.c.animation matches 1 as @s run function lodestone_teleport:teleport/animation
playsound block.beacon.activate ambient @a ~ ~ ~ 1 1 1

execute store result score @s lodestone_teleport.notify run scoreboard players get #lodestone_teleport lodestone_teleport.c.notify_cooldown
tag @s remove lodestone_teleport.TeleportHelper

advancement grant @s only lodestone_teleport:has_teleported
