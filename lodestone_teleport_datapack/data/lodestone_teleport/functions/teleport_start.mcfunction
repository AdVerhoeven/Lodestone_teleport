tag @s add TeleportHelper

# Call macro function for chunkloading and location checking.
execute as @s run function lodestone_teleport:teleport_setup

# Modify compass lore and name (in case they have not been set when the compass was used on a lodestone)
item modify entity @s weapon.mainhand lodestone_teleport:lodestone_compass/lodestone_full

# Display teleport animation if configured.
execute if score #lodestone_teleport lodestone_teleport_c_animation matches 1 as @s run function lodestone_teleport:teleport_animation
playsound block.beacon.activate ambient @p ~ ~ ~ 1 1 1

scoreboard players set @s lodestone_teleport_notify 1
tag @s remove TeleportHelper

advancement grant @s only global:lodestone_teleport/has_teleported