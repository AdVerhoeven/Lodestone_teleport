# The following line could be used to debug a little bit.
# $tellraw @a[tag=TeleportHelper,nbt={UUID:$(playerid)}] "Data: x:$(x), y:$(y), z:$(z), yaw:$(yaw), pitch:$(pitch), dimension:$(dimension), id:$(playerid)"

# Warn players of forceloading
execute if score #lodestone_teleport lodestone_teleport.c.notify_chunkload matches 1.. run tellraw @a[tag=TeleportHelper] [{"text": "[lodestone_teleport] ","color": "gold"},{"text": "Force loading target chunk!","color": "red"}]
# The macro function teleport
$execute in $(dimension) run forceload add $(x) $(z)
# Chunkloading complete message
execute if score #lodestone_teleport lodestone_teleport.c.notify_chunkload matches 1.. run tellraw @a[tag=TeleportHelper] [{"text": "[lodestone_teleport] ","color": "gold"},{"text": "Chunk loading complete!","color": "green"}]

tellraw @a[tag=TeleportHelper] [{"translate": "lodestone_teleport.title","fallback": "[lodestone_teleport] ", "color": "gold"},{"translate":"lodestone_teleport.location_check","fallback": "Checking location","color": "yellow"}]

# Check location, run abort function if unsafe
$execute in $(dimension) positioned $(x) $(y) $(z) unless predicate lodestone_teleport:safe_teleport run return run function lodestone_teleport:teleport_unsafe {x:$(x),y:$(y),z:$(z),dimension:"$(dimension)"}

# Actual player teleport
$execute in $(dimension) positioned $(x) $(y) $(z) rotated $(yaw) $(pitch) run tp @a[tag=TeleportHelper,nbt={UUID:$(playerid)}] ~ ~1 ~ ~ ~

tellraw @p ["",{"translate":"lodestone_teleport.title","fallback": "[lodestone_teleport]","color": "gold"},{"translate":"lodestone_teleport.teleport.success","fallback": "Teleport complete","color": "green"}]

# Remove forceload
$execute in $(dimension) run forceload remove $(x) $(z)

# Kill the marker
kill @s