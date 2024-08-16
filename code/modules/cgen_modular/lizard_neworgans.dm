/// Fixing horns organ
/obj/item/organ/external/horns/lizard
	name = "horns"
	desc = "Why do lizards even have horns? Well, this one obviously doesn't."
	icon_state = "horns"

	preference = "feature_lizard_horns"

	bodypart_overlay = /datum/bodypart_overlay/mutant/horns/lizard

/datum/bodypart_overlay/mutant/horns/lizard
	feature_key = "horns"

/datum/bodypart_overlay/mutant/horns/lizard/get_global_feature_list()
	return GLOB.horns_list_lizard



/// Fixing frills organ
/obj/item/organ/external/frills/lizard
	name = "frills"
	desc = "Ear-like external organs often seen on aquatic reptillians."
	icon_state = "frills"

	preference = "feature_lizard_frills"

	bodypart_overlay = /datum/bodypart_overlay/mutant/frills/lizard

/datum/bodypart_overlay/mutant/frills/lizard
	feature_key = "frills"

/datum/bodypart_overlay/mutant/frills/lizard/get_global_feature_list()
	return GLOB.frills_list_lizard



/// Fixing snout organ
/obj/item/organ/external/snout/lizard
	name = "lizard snout"
	desc = "Take a closer look at that snout!"
	icon_state = "snout"

	preference = "feature_lizard_snout"

	bodypart_overlay = /datum/bodypart_overlay/mutant/snout/lizard

/datum/bodypart_overlay/mutant/snout/lizard
	feature_key = "snout"

/datum/bodypart_overlay/mutant/snout/lizard/get_global_feature_list()
	return GLOB.snouts_list_lizard



/// == UPDATE PREFS TO NEW LISTS ==
// fix bodymarks
/datum/preference/choiced/lizard_body_markings/init_possible_values()
	return assoc_to_keys_features(GLOB.bodymarks_list_lizard)

// fix frills
/datum/preference/choiced/lizard_frills/init_possible_values()
	return assoc_to_keys_features(GLOB.frills_list_lizard)

/datum/preference/choiced/lizard_frills/icon_for(value)
	return generate_lizard_side_shot(GLOB.frills_list_lizard[value], "frills")

// fix horns
/datum/preference/choiced/lizard_horns/init_possible_values()
	return assoc_to_keys_features(GLOB.horns_list_lizard)

/datum/preference/choiced/lizard_horns/icon_for(value)
	return generate_lizard_side_shot(GLOB.horns_list_lizard[value], "horns")

// fix snouts
/datum/preference/choiced/lizard_snout/init_possible_values()
	return assoc_to_keys_features(GLOB.snouts_list_lizard)

/datum/preference/choiced/lizard_snout/icon_for(value)
	return generate_lizard_side_shot(GLOB.snouts_list_lizard[value], "snout", include_snout = FALSE)
