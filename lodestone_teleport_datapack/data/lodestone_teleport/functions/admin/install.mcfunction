# --- constants ---dummy
scoreboard objectives add lodestone_teleport_c_cooldown dummy
scoreboard objectives add lodestone_teleport_c_charge dummy
scoreboard objectives add lodestone_teleport_c_notify_chunkload dummy
scoreboard objectives add lodestone_teleport_c_animation dummy

scoreboard players set #lodestone_teleport lodestone_teleport_c_cooldown 50
scoreboard players set #lodestone_teleport lodestone_teleport_c_charge 10
scoreboard players set #lodestone_teleport lodestone_teleport_c_notify_chunkload 1
scoreboard players set #ldoestone_teleport lodestone_teleport_c_animation 1

# --- objectives ---
scoreboard objectives add lodestone_teleport_cooldown dummy
scoreboard objectives add lodestone_teleport_ok dummy
scoreboard objectives add lodestone_teleport_after dummy
scoreboard objectives add lodestone_teleport_notify dummy
scoreboard objectives add lodestone_teleport_X dummy
scoreboard objectives add lodestone_teleport_Y dummy
scoreboard objectives add lodestone_teleport_Z dummy

# --- defaults ---
scoreboard players set @a lodestone_teleport_ok 0
scoreboard players set @a lodestone_teleport_after 0
scoreboard players set @a lodestone_teleport_X 0
scoreboard players set @a lodestone_teleport_Y 0
scoreboard players set @a lodestone_teleport_Z 0

# --- finish install ---
data modify storage lodestone_teleport:internal is_installed set value 1b