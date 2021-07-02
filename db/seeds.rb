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

spearman = Character.create(role: "spearman", base_stats: {hp: 100, mp: 50, str: 100, dex: 25, int: 25, cri: 1,spd: 25, def: 25})
crusader = Character.create(role: "crusader", base_stats: {hp: 500, mp: 250, str: 500, dex: 125, int: 125, cri: 10, spd: 125, def: 125})
hero = Character.create(role: "hero", base_stats: {hp: 1000, mp: 500, str: 1000, dex: 250, int: 250, cri: 20,spd: 250, def: 250})
wizard = Character.create(role: "wizard", base_stats: {hp: 100, mp: 100, str: 0, dex: 0, int: 100, cri: 5,spd: 25, def: 25})
archer = Character.create(role: "archer", base_stats: {hp: 100, mp: 50, str: 25, dex: 100, int: 25, cri: 5,spd: 25, def: 25})

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

cupidStats = spearman.base_stats.merge!(current_hp: spearman.base_stats[:hp]).merge!(current_mp: spearman.base_stats[:mp])
cupid = UserCharacter.create(user: jasper, character: spearman, name: "Cupid", gold: 1000, level: 1, experience: 0, stats: cupidStats)

vang_satyr = Monster.create(name: "vang_satyr", base_stats: {hp: 25, mp: 25, str: 10, dex: 10, int: 10, cri: 2,spd: 10, def: 10}, level_range: "1-5", base_gold: 10, base_exp: 10, map: primeval_forest)

inventory = Inventory.create(user_character: cupid)

health_potion = Item.create(name: "health_potion", description: "A concentrated potion made out of pity berries.", effect: {increase: {hp: 30}, craft: ["5 pity_berry"]})
mana_potion = Item.create(name: "mana_potion", description: "A concentrated potion made out of cerebral berries.", effect: {increase: {mp: 30}, craft: ["5 cerebral_berry"]})
strength_potion = Item.create(name: "strength_potion", description: "A concentrated potion made out of renal berries.", effect: {increase: {str: 10}, craft: ["5 renal_berry"]})
range_potion = Item.create(name: "range_potion", description: "A concentrated potion made out of nympha berries.", effect: {increase: {dex: 10}, craft: ["5 nympha_berry"]})
magic_potion = Item.create(name: "magic_potion", description: "A concentrated potion made out of pimple berries.", effect: {increase: {int: 10}, craft: ["5 pimple_berry"]})

InventoryItem.create(inventory: inventory, item: health_potion, amount: 5)
InventoryItem.create(inventory: inventory, item: mana_potion, amount: 5)
InventoryItem.create(inventory: inventory, item: range_potion, amount: 5)
InventoryItem.create(inventory: inventory, item: magic_potion, amount: 5)
InventoryItem.create(inventory: inventory, item: strength_potion, amount: 5)

Drop.create(monster: vang_satyr, item: health_potion, amount: 1)

blunt_strike = Skill.create(name: "blunt_strike", effect: {attack: {damage: 30}}, description: "Deals the enemy a dull hit.", level: 1, character: spearman)
strength_buff = Skill.create(name: "strength_buff", effect: {buff: {str: "10%"}}, description: "Increases the player's strength by 20%", level: 2, character: spearman)
# scream = Skill.create(name: "scream", effect: , description: , level: 3, character: spearman)
# curse = Skill.create(name: "curse", effect: , description: , level: 5, character: spearman)
# deflect = Skill.create(name: "deflect", effect: , description: , level: 7, character: spearman)
# poison_jab = Skill.create(name: "poison_jab", effect: , description: , level: 10, character: spearman)
# charge = Skill.create(name: "charge", effect: , description: , level: 12, character: spearman)
# hyper_strength = Skill.create(name: "hyper_strength", effect: , description: , level: 15, character: spearman)
# skull_bash = Skill.create(name: "skull_bash", effect: , description: , level: 18, character: spearman)
# taunt = Skill.create(name: "taunt", effect: , description: , level: 20, character: spearman)
# renewal = Skill.create(name: "renewal", effect: , description: , level: 22, character: spearman)
# critical_strike = Skill.create(name: "critical_strike", effect: , description: , level: 25, character: spearman)
# guillotine = Skill.create(name: "guillotine", effect: , description: , level: 27, character: spearman)
# hyper_charge = Skill.create(name: "hyper_charge", effect: , description: , level: 29, character: spearman)
# blood_thirster = Skill.create(name: "blood_thirster", effect: , description: , level: 30, character: spearman)

UserCharacterSkill.create(user_character: cupid, skill: blunt_strike)
UserCharacterSkill.create(user_character: cupid, skill: strength_buff)

puts "seeding done"