# Lodestone_teleport
A minecraft datepack to enable teleporting using lodestones and lodestone compasses.

Heavily inspired on lodeport. https://github.com/NicolasBissig/Lodeport

## Supported Versions
This datapack has been updated to work with packversion 41 for minecraft java edition 1.20.5 and later. If you are running an older version of minecraft try lodeport. The oldest version that has been worked on for this datapack was packversion 15 for minecraft 1.20 and later.

## Datapack summary

### Item changes

* Using a compass on a lodestone will change its name and lore.
* Sneaking while holding a compass that is lodestone tracked will teleport the player to the target location (does not require the name/lore)

### Advancements

- root advancement for installed datapacks (assuming the other packs use the same root)
- advancement for this datapack
- advancement that tells the player if the resourcepack is used (in the hover-text, not the advancement itself).
- advancement that completes after the first teleport using the functionality of this datapack
- hidden dummy advancement that triggers renaming a compass used on a lodestone, is revoked to be able to trigger it again.

### Teleportation rules

- The player must be touching the ground.
- The player must be sneaking.
- The player must be holding a compass.
- The compass must be tracking a lodestone.
- The lodestone must have at least 2 non-solid blocks above it.
- The teleportation has a cooldown (see: Configuration)
- The teleportation has a charge time (see: Configuration)

## Installation

This datapack comes with a resourcepack allowing translations and/or altering of all messages should these be desired. To use this both the datapack and resourcepack need to be enabled. Without the resourcepack only the default fallback messages will appear.

### Configuration

The datapack comes with a limited configuration menu found by calling the function lodestone_teleport:admin/configure

Configurable settings:
- Charge time, the "rough" time in ticks it takes to charge before teleporting. Default: 20 ticks or 1 second.
- Cooldown, the minimum number of ticks to wait between 2 teleportations. Default: 50 ticks or 2.5 seconds
- Notify chunkload, disables the chunkloading messages

Other admin/configuration functions:
- lodestone_teleport:admin/install, does not have to be called manually as it should be called upon (re-)loading your world.

- lodestone_teleport:admin/uninstall, should remove most scoreboard entries and achievements, will only do a soft reset if the datapack has an unexpected name or location. It would be best to double check the exact name and location yourself by calling /datapack list and copying the name for this datapack into the uninstall function.



