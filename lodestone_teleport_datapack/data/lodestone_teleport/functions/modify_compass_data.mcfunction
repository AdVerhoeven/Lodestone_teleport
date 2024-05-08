tellraw @s ["",{"translate":"lodestone_teleport.title","fallback": "[lodestone_teleport]","color": "gold"},{"translate":"lodestone_teleport.compass.rename","fallback": "Your compass has been renamed by a magical force", "color": "white"}]
item modify entity @s weapon.mainhand lodestone_teleport:lodestone_compass/lodestone_lore
item modify entity @s weapon.mainhand lodestone_teleport:lodestone_compass/lodestone_name
advancement revoke @s only lodestone_teleport:compass_tracked