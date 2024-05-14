# --- install ---
execute unless data storage lodestone_teleport:internal is_installed run function lodestone_teleport:admin/install

# --- forceload ---
# In order for the teleports to work the chunk at 0 0 in each dimension should be loaded
# In "vanilla" worlds this should already be the case for minecraft:overworld and minecraft:the_nether, but not for minecraft:the_end
execute in overworld run forceload add 0 0
execute in the_end run forceload add 0 0
execute in the_nether run forceload add 0 0