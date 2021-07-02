puts "destroying current seeds..."
InventoryItem.destroy_all
Inventory.destroy_all
UserCharacterSkill.destroy_all
UserCharacter.destroy_all
Drop.destroy_all
Monster.destroy_all
Item.destroy_all
Skill.destroy_all
Character.destroy_all
Map.destroy_all
User.destroy_all

puts "creating seeds..."

jasper = User.create(username: "jasper20", password: "password", bio: "Taste my cupid shuffle!")

knight = Character.create(role: "knight", base_stats: {hp: 100, mp: 50, str: 100, dex: 25, int: 25, spd: 25, def: 25})
wizard = Character.create(role: "wizard", base_stats: {hp: 100, mp: 100, str: 0, dex: 0, int: 100, spd: 25, def: 25})
archer = Character.create(role: "archer", base_stats: {hp: 100, mp: 50, str: 25, dex: 100, int: 25, spd: 25, def: 25})

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

cupid = UserCharacter.create(user: jasper, character: knight, name: "Cupid", gold: 1000, level: 1, experience: 0, stats: knight.base_stats)

vang_satyr = Monster.create(name: "vang_satyr", base_stats: {hp: 25, mp: 25, str: 10, dex: 10, int: 10, spd: 10, def: 10}, level_range: "1-5", base_gold: 10, base_exp: 10, map: primeval_forest)

inventory = Inventory.create(user_character: cupid)

health_potion = Item.create(name: "health_potion", description: "A concentrated potion made out of pity berries.", effect: {increase: {hp: 30}, craft: ["5 pity_berry"]})
speed_potion = Item.create(name: "speed_potion", description: "A concentrated potion made out of renal berries.", effect: {increase: {spd: 10}, craft: ["5 renal_berry"]})
range_potion = Item.create(name: "range_potion", description: "A concentrated potion made out of nympha berries.", effect: {increase: {hp: 30}, craft: ["5 nympha_berry"]})
magic_potion = Item.create(name: "magic_potion", description: "A concentrated potion made out of cerebral berries.", effect: {increase: {spd: 10}, craft: ["5 cerebral_berry"]})
strength_potion = Item.create(name: "strength_potion", description: "A concentrated potion made out of pimple berries.", effect: {increase: {spd: 10}, craft: ["5 pimple_berry"]})

InventoryItem.create(inventory: inventory, item: health_potion, amount: 5)
InventoryItem.create(inventory: inventory, item: speed_potion, amount: 5)
InventoryItem.create(inventory: inventory, item: range_potion, amount: 5)
InventoryItem.create(inventory: inventory, item: magic_potion, amount: 5)
InventoryItem.create(inventory: inventory, item: strength_potion, amount: 5)

Drop.create(monster: vang_satyr, item: health_potion, amount: 1)

blunt_strike = Skill.create(name: "blunt_strike", effect: {attack: {damage: 30}}, description: "Deals the enemy a dull hit.", level: 1, character: knight)
strength_buff = Skill.create(name: "strength_buff", effect: {buff: {str: "10%"}}, description: "Increases the player's strength by 20%", level: 2, character: knight)
# scream = Skill.create(name: "scream", effect: , description: , level: 3, character: knight)
# curse = Skill.create(name: "curse", effect: , description: , level: 5, character: knight)
# deflect = Skill.create(name: "deflect", effect: , description: , level: 7, character: knight)
# poison_jab = Skill.create(name: "poison_jab", effect: , description: , level: 10, character: knight)
# charge = Skill.create(name: "charge", effect: , description: , level: 12, character: knight)
# hyper_strength = Skill.create(name: "hyper_strength", effect: , description: , level: 15, character: knight)
# skull_bash = Skill.create(name: "skull_bash", effect: , description: , level: 18, character: knight)
# taunt = Skill.create(name: "taunt", effect: , description: , level: 20, character: knight)
# renewal = Skill.create(name: "renewal", effect: , description: , level: 22, character: knight)
# critical_strike = Skill.create(name: "critical_strike", effect: , description: , level: 25, character: knight)
# guillotine = Skill.create(name: "guillotine", effect: , description: , level: 27, character: knight)
# hyper_charge = Skill.create(name: "hyper_charge", effect: , description: , level: 29, character: knight)
# blood_thirster = Skill.create(name: "blood_thirster", effect: , description: , level: 30, character: knight)

UserCharacterSkill.create(user_character_id: cupid, skill: blunt_strike)
UserCharacterSkill.create(user_character_id: cupid, skill: strength_buff)

puts "seeding done"