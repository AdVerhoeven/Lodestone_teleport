# --- constants ---dummy
scoreboard objectives add lodestone_teleport.c.cooldown dummy
scoreboard objectives add lodestone_teleport.c.charge dummy
scoreboard objectives add lodestone_teleport.c.notify_chunkload dummy
scoreboard objectives add lodestone_teleport.c.animation dummy
scoreboard objectives add lodestone_teleport.c.notify_cooldown dummy

scoreboard players set #lodestone_teleport lodestone_teleport.c.cooldown 50
scoreboard players set #lodestone_teleport lodestone_teleport.c.charge 10
scoreboard players set #lodestone_teleport lodestone_teleport.c.notify_chunkload 1
scoreboard players set #lodestone_teleport lodestone_teleport.c.animation 1
scoreboard players set #lodestone_teleport lodestone_teleport.c.notify_cooldown 1

# --- objectives ---
scoreboard objectives add lodestone_teleport.cooldown dummy
scoreboard objectives add lodestone_teleport.allowed dummy
scoreboard objectives add lodestone_teleport.notify dummy

# --- defaults ---
scoreboard players set @a lodestone_teleport.allowed 1

# --- finish install ---
data modify storage lodestone_teleport:internal is_installed set value 1b
tellraw @a [{"translate":"lodestone_teleport.title","fallback": "[lodestone_teleport] ","color": "gold"},{"translate":"lodestone_teleport.installed","fallback": "Datapack installed!\nMissing resourcepack!","color": "white"}]