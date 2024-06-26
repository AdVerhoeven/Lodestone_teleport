# Lodestone_teleport
A minecraft datepack to enable teleporting using lodestones and lodestone compasses.

Heavily inspired on lodeport. https://github.com/NicolasBissig/Lodeport

## Supported Versions
This datapack has been updated to work with packversion 41 for minecraft java edition 1.20.5 and later. If you are running an older version of minecraft try lodeport. The oldest version that has been worked on for this datapack was packversion 15 for minecraft 1.20 and later.

## Datapack summary

### Item changes

- Using a compass on a lodestone will change its name and lore.
- The lore and name changes are done using item modifiers. Vanilla dimensions have some unique colors and the specific dimension text can be changed using a resourcepack with a lang folder. Any non-vanilla dimensions use the lodestone_compass.lore.other.
- Adding custom dimension lore/color can be done by changing the corresponding item_modifier files.
- Sneaking while holding a compass that is lodestone tracked will teleport the player to the target location (does not require the name/lore)

### Advancements

- root advancement for installed datapacks (assuming the other packs use the same root)
- advancement for this datapack
- advancement that tells the player if the resourcepack is used (in the hover-text, not the advancement itself).
- advancement that completes after the first teleport using the functionality of this datapack
- hidden dummy advancement that triggers renaming a compass used on a lodestone, is revoked to be able to trigger it again.

### Teleportation rules

- The player must have a score of 1 or higher for lodestone_teleport.teleport_allowed.
- The player must be touching the ground.
- The player must be sneaking.
- The player must be holding a compass in their mainhand. (weapon.mainhand slot)
- The compass must be tracking a lodestone in one of the 3 vanilla dimensions.
- The teleportation has a cooldown (see: Configuration)
- The teleportation has a charge time (see: Configuration)
- The lodestone must have at least 2 non-solid blocks above it.
- The player will teleport 0.1 blocks above the center of the lodestone with their original orientation.

### Usage in creative

Because the datapack checks only the mainhand the renaming does not work in creative unless you equip the normal/untracked compass in your offhand and nothing in your mainhand. The reason being that the item that is renamed is always the item in the weapon.mainhand slot. In addition, teleporting using a tracked compass will always change the lore and name of the compass that was used.

Bug: if you use a compass from your mainhand its lore and name will change and it will display the placeholder magical dimension lore.

## Installation

This datapack comes with a resourcepack allowing translations and/or altering of all messages should these be desired. To use this both the datapack and resourcepack need to be enabled. Without the resourcepack only the default fallback messages will appear.

### Configuration

The datapack comes with a limited configuration menu found by calling the function lodestone_teleport:admin/configure

Configurable settings:
- Charge time, the "rough" time in ticks it takes to charge before teleporting. Default: 20 ticks or 1 second.
- Cooldown, the minimum number of ticks to wait between 2 teleportations. Default: 50 ticks or 2.5 seconds
- Notify chunkload, disables the chunkloading messages

Other admin/configuration functions:
- **lodestone_teleport:admin/install**, does not have to be called manually as it should be called upon (re-)loading your world.

- **lodestone_teleport:admin/uninstall**, should remove most scoreboard entries and achievements, will only do a soft reset if the datapack has an unexpected name or location. It would be best to double check the exact name and location yourself by calling /datapack list and copying the name for this datapack into the uninstall function.



