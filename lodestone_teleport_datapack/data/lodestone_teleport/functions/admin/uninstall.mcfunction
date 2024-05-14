# remove scoreboard constants
scoreboard objectives remove lodestone_teleport.c.cooldown
scoreboard objectives remove lodestone_teleport.c.charge
scoreboard objectives remove lodestone_teleport.c.notify_chunkload
scoreboard objectives remove lodestone_teleport.c.animation
scoreboard objectives remove lodestone_teleport.c.notify_cooldown

# remove scoreboard objectives
scoreboard objectives remove lodestone_teleport.cooldown
scoreboard objectives remove lodestone_teleport.allowed
scoreboard objectives remove lodestone_teleport.notify

advancement revoke @a from global:lodestone_teleport/datapack

datapack disable "lodestone_teleport"
datapack disable "file/lodestone_teleport"
datapack disable "lodestone_teleport_datapack"
datapack disable "file/lodestone_teleport_datapack"
data remove storage lodestone_teleport:internal is_installed
reload
tellraw @s [{"translate":"lodestone_teleport.title","fallback": "[lodestone_teleport] ","color": "gold"},{"text": "Uninstalled! safe to remove\n","color": "white"},{"text": "Warning! Reloading the world could reinstall the datapack unless it is disabled!","color": "red"}]