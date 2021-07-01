puts "destroying current seeds..."
InventoryItem.destroy_all
UserCharacterSkill.destroy_all
Inventory.destroy_all
Character.destroy_all
Item.destroy_all
Drop.destroy_all
Monster.destroy_all
UserCharacter.destroy_all
Skill.destroy_all
Map.destroy_all
User.destroy_all

puts "creating seeds..."

jasper = User.create(username: "jasper20", password: "password", bio: "Taste my cupid shuffle!")

knight = Character.create(role: "knight", base_stats: {hp: 100, str: 100, dex: 25, int: 25, spd: 25, def: 25})
wizard = Character.create(role: "wizard", base_stats: {hp: 100, str: 25, dex: 25, int: 100, spd: 25, def: 25})
archer = Character.create(role: "archer", base_stats: {hp: 100, str: 25, dex: 100, int: 25, spd: 25, def: 25})

cupid = UserCharacter.create(user: jasper, character: knight, name: "Cupid", gold: 1000, level: 1, experience: 0, stats: knight.base_stats)

arctic_forest = Map.create(name: arctic_forest)
chionidis = Map.create(name: chionidis)
nix_village = Map.create(name: nix_village)
pere_noel = Map.create(name: pere_noel)
tranquil_falls = Map.create(name: tranquil_falls)
twilight_woods = Map.create(name: twilight_woods)
mount_ender = Map.create(name: mount_ender)
hercule_peak = Map.create(name: hercule_peak)
eerie_mansion = Map.create(name: eerie_mansion)
spectral_grave = Map.create(name: spectral_grave)
arachnids_den = Map.create(name: arachnids_den)
sataia_park = Map.create(name: sataia_park)
elven_hideout = Map.create(name: elven_hideout)
primeval_forest = Map.create(name: primeval_forest)
wychwood = Map.create(name: wychwood)
aokigahara = Map.create(name: aokigahara)

vang_satyr = Monster.create(name: "vang_satyr", base_stats: {hp: 25, str: 10, dex: 10, int: 10, spd: 10, def: 10}, level_range: "1-5", base_gold: 10, base_exp: 10, map: primeval_forest)


puts "seeding done"