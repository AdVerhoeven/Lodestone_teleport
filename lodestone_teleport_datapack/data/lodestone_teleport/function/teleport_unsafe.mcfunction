# Call this when location checks fail to abort
tellraw @a[tag=TeleportHelper] [{"translate": "lodestone_teleport.title","fallback": "[lodestone_teleport] ", "color": "gold"},{"translate":"lodestone_teleport.location_unsafe","fallback": "Location is unsafe!","color": "red"}]
playsound entity.allay.hurt player @a[tag=TeleportHelper] ~ ~ ~ 1 1 1
execute if entity @s[type=!player] run kill @s
$execute in $(dimension) run forceload remove $(x) $(z)