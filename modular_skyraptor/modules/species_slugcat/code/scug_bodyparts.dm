/obj/item/bodypart/head/slugcat
	icon_greyscale = 'modular_skyraptor/modules/species_slugcat/icons/bodyparts.dmi'
	limb_id = SPECIES_SLUGCAT
	is_dimorphic = FALSE
	eyes_icon = 'modular_skyraptor/modules/species_slugcat/icons/slugcat_external.dmi'

/obj/item/bodypart/chest/slugcat
	icon_greyscale = 'modular_skyraptor/modules/species_slugcat/icons/bodyparts.dmi'
	limb_id = SPECIES_SLUGCAT
	is_dimorphic = TRUE

/obj/item/bodypart/arm/left/slugcat
	icon_greyscale = 'modular_skyraptor/modules/species_slugcat/icons/bodyparts.dmi'
	limb_id = SPECIES_SLUGCAT
	unarmed_attack_verbs = list("slash", "scratch", "claw")
	grappled_attack_verb = "lacerate"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'

/obj/item/bodypart/arm/right/slugcat
	icon_greyscale = 'modular_skyraptor/modules/species_slugcat/icons/bodyparts.dmi'
	limb_id = SPECIES_SLUGCAT
	unarmed_attack_verbs = list("slash", "scratch", "claw")
	grappled_attack_verb = "lacerate"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'

/obj/item/bodypart/leg/left/digitigrade/slugcat
	icon_greyscale = 'modular_skyraptor/modules/species_slugcat/icons/bodyparts.dmi'
	limb_id = BODYPART_ID_DIGITIGRADE
	bodyshape = BODYSHAPE_HUMANOID | BODYSHAPE_DIGITIGRADE

/obj/item/bodypart/leg/left/digitigrade/slugcat/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(limb_id == SPECIES_LIZARD)
		limb_id = SPECIES_SLUGCAT

/obj/item/bodypart/leg/right/digitigrade/slugcat
	icon_greyscale = 'modular_skyraptor/modules/species_slugcat/icons/bodyparts.dmi'
	limb_id = BODYPART_ID_DIGITIGRADE
	bodyshape = BODYSHAPE_HUMANOID | BODYSHAPE_DIGITIGRADE

/obj/item/bodypart/leg/right/digitigrade/slugcat/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(limb_id == SPECIES_LIZARD)
		limb_id = SPECIES_SLUGCAT
