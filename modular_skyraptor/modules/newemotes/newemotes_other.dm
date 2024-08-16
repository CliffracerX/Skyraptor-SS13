// credit for dook and raow to Tannhauser Dock
/datum/emote/living/dook
	key = "dook"
	key_third_person = "dooks"
	message = "dooks like a ferret!"
	hands_use_check = FALSE
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	audio_cooldown = 2 SECONDS

/datum/emote/living/dook/get_sound(mob/living/user)
	return pick('modular_skyraptor/modules/newemotes/sounds/tannhauser_dook.ogg')

/datum/emote/living/raow
	key = "raow"
	key_third_person = "raows"
	message = "lets out a tired raow."
	hands_use_check = FALSE
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	audio_cooldown = 2 SECONDS

/datum/emote/living/raow/get_sound(mob/living/user)
	return pick('modular_skyraptor/modules/newemotes/sounds/tannhauser_raow.ogg')
