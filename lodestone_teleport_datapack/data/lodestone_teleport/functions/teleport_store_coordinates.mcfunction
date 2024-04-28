# check if player is holding a lodestone tracked compass (has x position at least)
scoreboard players set @s lodestone_teleport_ok 0
execute store success score @s lodestone_teleport_ok run data get entity @s SelectedItem.tag.LodestoneTracked

# store LodestonePos in player score
execute store result score @s lodestone_teleport_X run data get entity @s SelectedItem.tag.LodestonePos.X
execute store result score @s lodestone_teleport_Y run data get entity @s SelectedItem.tag.LodestonePos.Y
# add one to teleport ontop the lodestone
scoreboard players add @s lodestone_teleport_Y 1
execute store result score @s lodestone_teleport_Z run data get entity @s SelectedItem.tag.LodestonePos.Z