# --- install ---
execute unless data storage lodestone_teleport is_installed run function lodestone_teleport:admin/install
execute if data storage lodestone_teleport is_installed run tellraw @a [{"translate":"lodestone_teleport.title","fallback": "[lodestone_teleport] ","color": "gold"},{"translate":"lodestone_teleport.installed","fallback": "Datapack installed!\nMissing resourcepack!","color": "white"}]

# --- forceload ---
# In order for the teleports to work the chunk at 0 0 in each dimension should be loaded
# In "vanilla" worlds this should already be the case for minecraft:overworld and minecraft:the_nether, but not for minecraft:the_end
execute in overworld run forceload add 0 0
execute in the_end run forceload add 0 0
execute in the_nether run forceload add 0 0