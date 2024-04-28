# remove scoreboard constants
scoreboard objectives remove lodestone_teleport_c_cooldown
scoreboard objectives remove lodestone_teleport_c_charge
scoreboard objectives remove lodestone_teleport_c_notify_chunkload

# remove scoreboard objectives
scoreboard objectives remove lodestone_teleport_cooldown
scoreboard objectives remove lodestone_teleport_ok
scoreboard objectives remove lodestone_teleport_after
scoreboard objectives remove lodestone_teleport_notify
scoreboard objectives remove lodestone_teleport_X
scoreboard objectives remove lodestone_teleport_Y
scoreboard objectives remove lodestone_teleport_Z

data remove storage lodestone_teleport is_installed
tellraw @s [{"translate":"lodestone_teleport.title","fallback": "[lodestone_teleport] ","color": "gold"},{"text": "Uninstalled! safe to remove\n","color": "white"},{"text": "Warning! Reloading the world will reinstall unless the datapack is disabled!","color": "red"}]