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
Experience.destroy_all

puts "creating seeds..."

jasper = User.create(username: "jasper20", password: "password", bio: "Taste my cupid shuffle!")

spearman = Character.create(role: "spearman", base_stats: {hp: 50, mp: 25, str: 50, dex: 25, int: 0, cri: 1,spd: 25, def: 25})
crusader = Character.create(role: "crusader", base_stats: {hp: 100, mp: 50, str: 100, dex: 50, int: 25, cri: 10, spd: 50, def: 50})
hero = Character.create(role: "hero", base_stats: {hp: 200, mp: 100, str: 200, dex: 100, int: 50, cri: 20, spd: 100, def: 100})
hunter = Character.create(role: "hunter", base_stats: {hp: 50, mp: 25, str: 0, dex: 50, int: 25, cri: 1,spd: 25, def: 25})
crossbowman = Character.create(role: "crossbowman", base_stats: {hp: 100, mp: 50, str: 25, dex: 100, int: 50, cri: 10,spd: 50, def: 50})
robinhood = Character.create(role: "robinhood", base_stats: {hp: 200, mp: 100, str: 50, dex: 200, int: 100, cri: 20,spd: 100, def: 100})
magician = Character.create(role: "magician", base_stats: {hp: 50, mp: 50, str: 0, dex: 0, int: 50, cri: 1,spd: 25, def: 25})
sorcerer = Character.create(role: "sorcerer", base_stats: {hp: 100, mp: 100, str: 0, dex: 25, int: 100, cri: 10,spd: 50, def: 50})
elysianist = Character.create(role: "elysianist", base_stats: {hp: 200, mp: 200, str: 25, dex: 25, int: 200, cri: 20,spd: 100, def: 100})

arctic_forest = Map.create(name: "arctic_forest")
chionidis = Map.create(name: "chionidis")
nix_village = Map.create(name: "nix_village")
pere_noel = Map.create(name: "pere_noel")
tranquil_falls = Map.create(name: "tranquil_falls")
twilight_woods = Map.create(name: "twilight_woods")
mount_ender = Map.create(name: "mount_ender")
hercule_peak = Map.create(name: "hercule_peak")
eerie_mansion = Map.create(name: "eerie_mansion")
spectral_grave = Map.create(name: "spectral_grave")
arachnids_den = Map.create(name: "arachnids_den")
sataia_park = Map.create(name: "sataia_park")
elven_hideout = Map.create(name: "elven_hideout")
primeval_forest = Map.create(name: "primeval_forest")
wychwood = Map.create(name: "wychwood")
aokigahara = Map.create(name: "aokigahara")

cupidStats = spearman.base_stats.merge!(current_hp: spearman.base_stats[:hp]).merge!(current_mp: spearman.base_stats[:mp])
cupid = UserCharacter.create(user: jasper, character: spearman, name: "Cupid", gold: 0, level: 1, experience: 0, stats: cupidStats)

vang_satyr = Monster.create(name: "vang_satyr", base_stats: {hp: 25, mp: 0, str: 25, dex: 25, int: 25, cri: 2, spd: 25, def: 25}, level_range: "1-2", base_gold: 10, base_exp: 10, map: primeval_forest)
# vang_satyr2 = Monster.create(name: "vang_satyr", base_stats: {hp: 10, mp: 0, str: 10, dex: 10, int: 10, cri: 2, spd: 10, def: 10}, level_range: "2-3", base_gold: 10, base_exp: 10, map: primeval_forest)
# vang_satyr3 = Monster.create(name: "vang_satyr", base_stats: {hp: 10, mp: 0, str: 10, dex: 10, int: 10, cri: 2, spd: 10, def: 10}, level_range: "4-5", base_gold: 10, base_exp: 10, map: primeval_forest)

inventory = Inventory.create(user_character_id: cupid.id)

health_potion = Item.create(name: "health_potion", description: "A concentrated potion made out of pity berries.", effect: {increase: {hp: 30}, craft: ["5 pity_berry"]})
mana_potion = Item.create(name: "mana_potion", description: "A concentrated potion made out of cerebral berries.", effect: {increase: {mp: 30}, craft: ["5 cerebral_berry"]})
strength_potion = Item.create(name: "strength_potion", description: "A concentrated potion made out of renal berries.", effect: {increase: {str: 10}, craft: ["5 renal_berry"]})
range_potion = Item.create(name: "range_potion", description: "A concentrated potion made out of nympha berries.", effect: {increase: {dex: 10}, craft: ["5 nympha_berry"]})
magic_potion = Item.create(name: "magic_potion", description: "A concentrated potion made out of pimple berries.", effect: {increase: {int: 10}, craft: ["5 pimple_berry"]})

Drop.create(monster: vang_satyr, item: health_potion, amount: 1)
# Drop.create(monster: vang_satyr2, item: health_potion, amount: 3)
# Drop.create(monster: vang_satyr3, item: health_potion, amount: 5)

blunt_strike = Skill.create(name: "blunt_strike", effect: {mp: 7, attack: {damage: 10}}, description: "Deals the enemy a dull hit.", level: 1, character: spearman)
strength_buff = Skill.create(name: "strength_buff", effect: {mp: 15, buff: {str: "10%"}}, description: "Increases the player's strength by 10%.", level: 2, character: spearman)
scream = Skill.create(name: "scream", effect: {mp: 10, debuff: {def: "10%"}}, description: "Lets out a thunderous scream, lowering the enemy's defense by 10%.", level: 3, character: spearman)
poison_jab = Skill.create(name: "poison_jab", effect: {mp: 12, attack: {damage: 20}}, description: "Strikes the enemy with poison.", level: 5, character: spearman)
# deflect = Skill.create(name: "deflect", effect: , description: , level: 7, character: spearman)
# curse = Skill.create(name: "curse", effect: {debuff: {}}, description: , level: 10, character: spearman)
# charge = Skill.create(name: "charge", effect: , description: , level: 12, character: spearman)
# hyper_strength = Skill.create(name: "hyper_strength", effect: , description: , level: 15, character: spearman)
# skull_bash = Skill.create(name: "skull_bash", effect: , description: , level: 18, character: spearman)
# taunt = Skill.create(name: "taunt", effect: , description: , level: 20, character: spearman)
# critical_strike = Skill.create(name: "critical_strike", effect: , description: , level: 22, character: spearman)
# renewal = Skill.create(name: "renewal", effect: , description: , level: 25, character: spearman)
# guillotine = Skill.create(name: "guillotine", effect: , description: , level: 27, character: spearman)
# hyper_charge = Skill.create(name: "hyper_charge", effect: , description: , level: 29, character: spearman)
# blood_thirster = Skill.create(name: "blood_thirster", effect: , description: , level: 30, character: spearman)

electroball = Skill.create(name: "electroball", effect: {mp: 10, attack: {damage: 20}}, description: "Unleashes a ball of electricity towards the enemy.", level: 1, character: magician)
magic_buff = Skill.create(name: "magic_buff", effect: {mp: 15,buff: {int: "10%"}}, description: "Increases the player's intelligence by 10%.", level: 2, character: magician)
flee = Skill.create(name: "flee", effect: {chance: {mp: 10, passive: "10%"}}, description: "Gives the player a 10% chance of escaping from battle when their health drops below 10%.", level: 3, character: magician)
fireball = Skill.create(name: "fireball", effect: {mp: 20, attack: {damage: 30}}, description: "Unleashes a ball of fire towards the enemy.", level: 5, character: magician)
# healing_buff = Skill.create(name: "healing_buff", effect: , description: , level: 7, character: magician)
# confusion = Skill.create(name: "confusion", effect: , description: , level: 10, character: magician)
# lightning_strike = Skill.create(name: "lightning_strike", effect: , description: , level: 12, character: magician)
# sorcery = Skill.create(name: "sorcery", effect: , description: , level: 15, character: magician)
# lightning_missile = Skill.create(name: "lightning_missile", effect: , description: , level: 18, character: magician)
# absorb = Skill.create(name: "absorb", effect: , description: , level: 20, character: magician)
# storm = Skill.create(name: "storm", effect: , description: , level: 22, character: magician)
# rebirth = Skill.create(name: "rebirth", effect: , description: , level: 25, character: magician)
# meteor_strike = Skill.create(name: "meteor_strike", effect: , description: , level: 27, character: magician)
# destruction = Skill.create(name: "destruction", effect: , description: , level: 29, character: magician)
# armageddon = Skill.create(name: "armageddon", effect: , description: , level: 30, character: magician)

sneak = Skill.create(name: "sneak", effect: {mp: 7, attack: {damage: 10}}, description: "The player has a 20% chance of sneaking in a hit on the enemey before the start of the battle.", level: 1, character: hunter)
range_buff = Skill.create(name: "range_buff", effect: {mp: 15, buff: {dex: "10%"}}, description: "Increases the player's dexterity by 10%.", level: 2, character: hunter)
crybaby = Skill.create(name: "crybaby", effect: {mp: 10, debuff: {spd: "50%"}}, description: "Pretend to cry, dropping the enemy's guard and lowering their speed by 50%.", level: 3, character: hunter)
holy_shot = Skill.create(name: "holy_shot", effect: {mp: 12, attack: {damage: 20}}, description: "Fire a ball of spiritual energy.", level: 5, character: hunter)
# eagle_eye = Skill.create(name: "eagle_eye", effect: , description: , level: 7, character: hunter)
# sleep_powder = Skill.create(name: "sleep_powder", effect: , description: , level: 10, character: hunter)
# arrow_mirrage = Skill.create(name: "arrow_mirrage", effect: , description: , level: 12, character: hunter)
# marksmanship = Skill.create(name: "marksmanship", effect: , description: , level: 15, character: hunter)
# silhouette_mirage = Skill.create(name: "silhouette_mirage", effect: , description: , level: 18, character: hunter)
# intimidate = Skill.create(name: "intimidate", effect: , description: , level: 20, character: hunter)
# thief = Skill.create(name: "thief", effect: , description: , level: 22, character: hunter)
# prayer = Skill.create(name: "prayer", effect: , description: , level: 25, character: hunter)
# summoning_circle = Skill.create(name: "summoning_circle", effect: , description: , level: 27, character: hunter)
# arrow_storm = Skill.create(name: "arrow_storm", effect: , description: , level: 29, character: hunter)
# mortal_blow = Skill.create(name: "mortal_blow", effect: , description: , level: 30, character: hunter)

UserCharacterSkill.create(user_character: cupid, skill: blunt_strike)

Experience.create(level: 1, exp: 0)
Experience.create(level: 2, exp: 83)
Experience.create(level: 3, exp: 174)
Experience.create(level: 4, exp: 276)
Experience.create(level: 5, exp: 388)
Experience.create(level: 6, exp: 512)
Experience.create(level: 7, exp: 650)
Experience.create(level: 8, exp: 801)
Experience.create(level: 9, exp: 969)
Experience.create(level: 10, exp: 1154)
Experience.create(level: 11, exp: 1358)
Experience.create(level: 12, exp: 1584)
Experience.create(level: 13, exp: 1833)
Experience.create(level: 14, exp: 2107)
Experience.create(level: 15, exp: 2411)
Experience.create(level: 16, exp: 2746)
Experience.create(level: 17, exp: 3115)
Experience.create(level: 18, exp: 3523)
Experience.create(level: 19, exp: 3973)
Experience.create(level: 20, exp: 4470)
Experience.create(level: 21, exp: 5018)
Experience.create(level: 22, exp: 5624)
Experience.create(level: 23, exp: 6291)
Experience.create(level: 24, exp: 7028)
Experience.create(level: 25, exp: 7842)
Experience.create(level: 26, exp: 8740)
Experience.create(level: 27, exp: 9730)
Experience.create(level: 28, exp: 10824)
Experience.create(level: 29, exp: 12031)
Experience.create(level: 30, exp: 13363)

puts "seeding done"