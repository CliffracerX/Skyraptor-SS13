/datum/outfit/deathmatch_loadout //remember that fun > balance
	name = ""
	shoes = /obj/item/clothing/shoes/sneakers/black // im not doing this on all of them
	/// Name shown in the UI
	var/display_name = ""
	/// Description shown in the UI
	var/desc = ":KILL:"
	/// If defined, using this outfit sets the targets species to it
	var/datum/species/species_override
	/// This outfit will grant these spells if applied
	var/list/granted_spells = list()

/datum/outfit/deathmatch_loadout/pre_equip(mob/living/carbon/human/user, visualsOnly = FALSE)
	. = ..()
	if(isdummy(user))
		return

	if(!isnull(species_override))
		user.set_species(species_override)
	else if (istype(user.dna.species.outfit_important_for_life)) //plasmamen get lit on fire and die
		user.set_species(/datum/species/human)
	for(var/datum/action/act as anything in granted_spells)
		var/datum/action/new_ability = new act(user)
		new_ability.Grant(user)

/datum/outfit/deathmatch_loadout/naked
	name = "Deathmatch: Naked"
	display_name = "Unarmed, Butt-naked"
	desc = "Naked man craves for bloodshed."
	shoes = null

/datum/outfit/deathmatch_loadout/assistant
	name = "Deathmatch: Assistant loadout"
	display_name = "Assistant"
	desc = "A simple assistant loadout: greyshirt and a toolbox"

	l_hand = /obj/item/storage/toolbox/mechanical
	uniform = /obj/item/clothing/under/color/grey
	back = /obj/item/storage/backpack
	box = /obj/item/storage/box/survival
	belt = /obj/item/flashlight

/datum/outfit/deathmatch_loadout/assistant/weaponless
	name = "Deathmatch: Assistant loadout (Weaponless)"
	display_name = "Assistant (Unarmed)"
	desc = "What is an assistant without a toolbox? nothing"
	l_hand = null

/datum/outfit/deathmatch_loadout/operative
	name = "Deathmatch: Operative"
	display_name = "Operative"
	desc = "A syndicate operative."

	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	back = /obj/item/storage/backpack
	id = /obj/item/card/id/advanced/chameleon

/datum/outfit/deathmatch_loadout/operative/ranged
	name = "Deathmatch: Ranged Operative"
	display_name = "Ranged Operative"
	desc = "A syndicate operative with a gun and a knife."

	l_hand = /obj/item/gun/ballistic/automatic/pistol
	l_pocket = /obj/item/knife/combat
	backpack_contents = list(/obj/item/ammo_box/magazine/m9mm = 5)

/datum/outfit/deathmatch_loadout/operative/melee
	name = "Deathmatch: Melee Operative"
	display_name = "Melee Operative"
	desc = "A syndicate operative with multiple knives."

	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	suit = /obj/item/clothing/suit/armor/vest
	head = /obj/item/clothing/head/helmet
	backpack_contents = list(/obj/item/knife/combat = 6)
	l_hand = /obj/item/knife/combat
	l_pocket = /obj/item/knife/combat

/datum/outfit/deathmatch_loadout/securing_sec
	name = "Deathmatch: Security Officer"
	display_name = "Security Officer"
	desc = "A security officer."

	uniform = /datum/outfit/job/security::uniform
	suit = /datum/outfit/job/security::suit
	suit_store = /datum/outfit/job/security::suit_store
	belt = /datum/outfit/job/security::belt
	ears = /datum/outfit/job/security::ears //cant communicate with station i think?
	gloves = /datum/outfit/job/security::gloves
	head = /datum/outfit/job/security::head
	shoes = /datum/outfit/job/security::shoes
	l_pocket = /obj/item/flashlight/seclite
	l_hand = /obj/item/gun/energy/disabler
	r_pocket = /obj/item/knife/combat/survival
	back = /datum/outfit/job/security::backpack
	box = /datum/outfit/job/security::box
	implants = list(/obj/item/implant/mindshield)

/datum/outfit/deathmatch_loadout/assistant/instagib
	name = "DM: Instagib"
	display_name = "Instagib"
	desc = "Assistant with an instakill rifle."

	l_hand = /obj/item/gun/energy/laser/instakill

/datum/outfit/deathmatch_loadout/operative/sniper
	name = "Deathmatch: Sniper"
	display_name = "Sniper"
	desc = "You know what do you need to do"
	backpack_contents = list(
		/obj/item/ammo_box/magazine/sniper_rounds = 3,
	)
	glasses = /obj/item/clothing/glasses/thermal
	uniform = /obj/item/clothing/under/syndicate/sniper
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	l_pocket = /obj/item/knife/combat
	l_hand = /obj/item/gun/ballistic/rifle/sniper_rifle

/datum/outfit/deathmatch_loadout/chef
	name = "Deathmatch: Chef"
	display_name = "Chef"
	desc = "He love pizza."
	uniform = /obj/item/clothing/under/costume/buttondown/slacks/service
	suit = /obj/item/clothing/suit/toggle/chef
	head = /obj/item/clothing/head/utility/chefhat
	mask = /obj/item/clothing/mask/fakemoustache/italian
	gloves = /obj/item/clothing/gloves/the_sleeping_carp
	back = /obj/item/storage/backpack
	backpack_contents = list(
		/obj/item/sharpener,
	)

/datum/outfit/deathmatch_loadout/samurai
	name = "Deathmatch: Samurai"
	display_name = "Samurai"
	desc = "Bare-footed man craves to bloodshed."
	l_hand = /obj/item/katana
	uniform = /obj/item/clothing/under/costume/gi

/// battlers

/datum/outfit/deathmatch_loadout/battler
	name = "Deathmatch: Battler Base"
	display_name = "Battler"
	desc = "What is a battler whith out weapone?."

	shoes = /obj/item/clothing/shoes/combat
	uniform = /obj/item/clothing/under/syndicate
	gloves = /obj/item/clothing/gloves/combat
	back = /obj/item/storage/backpack
	id = /obj/item/card/id/advanced/chameleon

/datum/outfit/deathmatch_loadout/battler/soldier
	name = "Deathmatch: Soldier"
	display_name = "Soldier"
	desc = "Ready for combat."

	l_hand = /obj/item/gun/ballistic/rifle/boltaction
	l_pocket = /obj/item/knife/combat
	uniform = /obj/item/clothing/under/syndicate/rus_army
	suit = /obj/item/clothing/suit/armor/vest
	head = /obj/item/clothing/head/helmet/rus_helmet
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated

	backpack_contents = list(
		/obj/item/grenade/smokebomb = 2,
		/obj/item/ammo_box/strilka310 = 2,
	)

/datum/outfit/deathmatch_loadout/battler/druid
	name = "Deathmatch: Druid"
	display_name = "Druid"
	desc = "How can plants help you?"
	species_override = /datum/species/pod
	l_hand = /obj/item/gun/ballistic/bow
	r_hand = /obj/item/ammo_casing/arrow
	l_pocket = /obj/item/knife/shiv/carrot
	r_pocket = /obj/item/flashlight/lantern
	head = /obj/item/food/grown/ambrosia/gaia
	uniform = /obj/item/clothing/under/shorts/green
	mask = /obj/item/clothing/mask/gas/tiki_mask
	glasses = /obj/item/clothing/glasses/thermal
	gloves = /obj/item/clothing/gloves/botanic_leather
	belt = /obj/item/gun/syringe/blowgun
	back = /obj/item/storage/backpack/saddlepack
	shoes = /obj/item/clothing/shoes/sandal
	backpack_contents = list(
		/obj/item/reagent_containers/syringe/crude/mushroom = 1,
		/obj/item/reagent_containers/syringe/crude/blastoff = 1,
		/obj/item/ammo_casing/arrow = 2,
		/obj/item/food/grown/nettle/death = 2,
		/obj/item/food/grown/banana = 2,
		/obj/item/food/grown/cherry_bomb = 2,
		/obj/item/food/grown/mushroom/walkingmushroom = 2,
		/obj/item/seeds/kudzu = 1,
	)

/datum/outfit/deathmatch_loadout/battler/northstar
	name = "Deathmatch: North Star"
	display_name = "North Star"
	desc = "flip flip flip"

	uniform = /obj/item/clothing/under/suit/carpskin
	head = /obj/item/clothing/head/fedora/carpskin
	gloves = /obj/item/clothing/gloves/rapid
	backpack_contents = list(
		/obj/item/throwing_star = 6,
		/obj/item/restraints/legcuffs/bola/tactical = 2,
	)

/datum/outfit/deathmatch_loadout/battler/janitor
	name = "Deathmatch: Janitor"
	display_name = "Janitor"
	desc = "Regular work"

	uniform = /obj/item/clothing/under/rank/civilian/janitor
	suit = /obj/item/clothing/suit/caution
	head = /obj/item/reagent_containers/cup/bucket
	shoes = /obj/item/clothing/shoes/chameleon/noslip
	l_hand = /obj/item/pushbroom
	l_pocket = /obj/item/reagent_containers/spray/waterflower/lube
	backpack_contents = list(
		/obj/item/grenade/chem_grenade/cleaner = 2,
		/obj/item/restraints/legcuffs/beartrap = 3,
		/obj/item/soap,
	)

/datum/outfit/deathmatch_loadout/battler/surgeon
	name = "Deathmatch: Surgeon"
	display_name = "Surgeon"
	desc = "Treatment has come"

	uniform = /obj/item/clothing/under/rank/medical/scrubs/blue
	suit = /obj/item/clothing/suit/apron/surgical
	head = /obj/item/clothing/head/utility/surgerycap
	mask = /obj/item/clothing/mask/surgical
	glasses = /obj/item/clothing/glasses/hud/health/night
	l_pocket = /obj/item/reagent_containers/hypospray/combat
	r_pocket = /obj/item/reagent_containers/hypospray/medipen/penthrite
	l_hand = /obj/item/chainsaw

	backpack_contents = list(
		/obj/item/storage/medkit/tactical,
		/obj/item/reagent_containers/hypospray/medipen/stimulants,
	)

/datum/outfit/deathmatch_loadout/battler/raider
	name = "Deathmatch: Raider"
	display_name = "Raider"
	desc = "Not from Shadow Legends"

	l_hand = /obj/item/nullrod/claymore/chainsaw_sword
	r_pocket = /obj/item/switchblade
	uniform = /obj/item/clothing/under/costume/jabroni
	back = /obj/item/spear
	belt = /obj/item/gun/magic/hook
	head = /obj/item/clothing/head/utility/welding

/datum/outfit/deathmatch_loadout/battler/clown
	name = "DM: Clown"
	display_name = "Clown (Man Of Honk)"
	desc = "Who called this honking clown"

	uniform = /datum/outfit/job/clown::uniform
	belt = /datum/outfit/job/clown::belt
	shoes = /datum/outfit/job/clown::shoes
	mask = /datum/outfit/job/clown::mask
	l_pocket = /datum/outfit/job/clown::l_pocket
	back = /datum/outfit/job/clown::backpack
	box = /datum/outfit/job/clown::box
	implants = list(/obj/item/implant/sad_trombone)
	l_pocket = /obj/item/melee/energy/sword/bananium
	r_pocket = /obj/item/shield/energy/bananium
	gloves = /obj/item/clothing/gloves/tackler/rocket

	backpack_contents = list(
		/obj/item/reagent_containers/spray/waterflower = 1,
		/obj/item/instrument/bikehorn = 1,
		/obj/item/bikehorn/airhorn = 1,
		/obj/item/food/grown/banana = 3,
		/obj/item/food/pie/cream = 2,
		)

/datum/outfit/deathmatch_loadout/battler/tgcoder //tg doesnt stand for tgstation dont ask
	name = "Deathmatch: Coder"
	display_name = "Coder"
	desc = "What"

	l_hand = /obj/item/toy/katana
	uniform = /obj/item/clothing/under/costume/schoolgirl
	suit = /obj/item/clothing/suit/costume/joker
	shoes = /obj/item/clothing/shoes/clown_shoes/meown_shoes
	head = /obj/item/clothing/head/costume/kitty
	backpack_contents = list(
		/obj/item/reagent_containers/cup/soda_cans/pwr_game = 10,
	)

/datum/outfit/deathmatch_loadout/battler/enginer
	name = "Deathmatch: Engineer"
	display_name = "Engineer"
	desc = "Meet the engineer"

	l_hand = /obj/item/storage/toolbox/emergency/turret
	uniform = /obj/item/clothing/under/rank/engineering/engineer
	shoes = /obj/item/clothing/shoes/magboots
	head = /obj/item/clothing/head/utility/hardhat
	back = /obj/item/fireaxe
	gloves = /obj/item/clothing/gloves/color/yellow

/datum/outfit/deathmatch_loadout/battler/scientist
	name = "Deathmatch: Scientist"
	display_name = "Scientist"
	desc = "What a nerd"

	uniform = /obj/item/clothing/under/rank/rnd/scientist
	suit = /obj/item/clothing/suit/armor/reactive/stealth
	mask = /obj/item/clothing/mask/gas
	l_hand = /obj/item/reagent_containers/syringe/plasma
	l_pocket = /obj/item/slimecross/stabilized/sepia
	r_pocket = /obj/item/slimecross/stabilized/purple
	backpack_contents = list(
		/obj/item/reagent_containers/cup/bottle/plasma,
		/obj/item/slimecross/burning/grey,
		/obj/item/slimecross/burning/adamantine,
		/obj/item/slimecross/burning/gold,
		/obj/item/slimecross/burning/blue,
		/obj/item/slimecross/burning/sepia,
		/obj/item/slimecross/chilling/green,
		/obj/item/slimecross/chilling/grey,
		/obj/item/slimecross/industrial/oil,
		/obj/item/slimecross/charged/silver,
		/obj/item/slimecross/charged/black,
		/obj/item/slimecross/burning/rainbow,
		/obj/item/slimecross/chilling/adamantine,
	)

/datum/outfit/deathmatch_loadout/battler/bloodminer
	name = "Deathmatch: Blood Miner"
	display_name = "Blood Miner"
	desc = "Rip and tear!!!"

	l_hand = /obj/item/melee/cleaving_saw
	r_hand = /obj/item/gun/energy/recharge/kinetic_accelerator
	uniform = /obj/item/clothing/under/rank/cargo/miner/lavaland
	suit = /obj/item/clothing/suit/hooded/explorer
	shoes = /obj/item/clothing/shoes/workboots/mining
	mask = /obj/item/clothing/mask/gas/explorer
	granted_spells = list(
		/datum/action/cooldown/mob_cooldown/dash,
	)

/datum/outfit/deathmatch_loadout/battler/ripper
	name = "Deathmatch: Ripper"
	display_name = "Ripper"
	desc = "Die die die!!!"

	l_hand = /obj/item/gun/ballistic/shotgun/hook
	r_hand = /obj/item/gun/ballistic/shotgun/hook
	uniform = /obj/item/clothing/under/costume/skeleton
	suit = /obj/item/clothing/suit/hooded/cultrobes/eldritch
	mask = /obj/item/clothing/mask/gas/cyborg
	shoes = /obj/item/clothing/shoes/sandal
	belt = /obj/item/melee/cleric_mace

/datum/outfit/deathmatch_loadout/battler/cowboy
	name = "Deathmatch: Cowboy"
	display_name = "Cowboy"
	desc = "Yeehaw partner"

	r_hand  = /obj/item/clothing/mask/cigarette/cigar
	l_hand = /obj/item/melee/curator_whip
	l_pocket = /obj/item/lighter
	accessory = /obj/item/clothing/accessory/vest_sheriff
	uniform = /obj/item/clothing/under/rank/security/detective
	shoes = /obj/item/clothing/shoes/cowboy
	belt = /obj/item/storage/belt/holster/detective/full
	head = /obj/item/clothing/head/cowboy/brown
