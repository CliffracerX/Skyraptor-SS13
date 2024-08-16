#define AIRTANK_MAX_SAFE_PRESSURE 2533
#define MODPAINT_MAX_COLOR_VALUE 1.25
#define MODPAINT_MIN_COLOR_VALUE 0
#define MODPAINT_MAX_SECTION_COLORS 2
#define MODPAINT_MIN_SECTION_COLORS 0.25
#define MODPAINT_MAX_OVERALL_COLORS 4
#define MODPAINT_MIN_OVERALL_COLORS 1.5

/obj/item/tank/internals/
	icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items.dmi'
	worn_icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items_suit.dmi'
	lefthand_file = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items_lh.dmi'
	righthand_file = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items_rh.dmi'
	var/gauge_overlay = "fullsize"

/obj/item/tank/internals/update_overlays()
	var/list/overlays = ..()
	var/datum/gas_mixture/air = return_air()
	var/mutable_appearance/gaugestate = mutable_appearance(icon, "[gauge_overlay]_10")
	if(air != null)
		//to_chat(world, span_notice("Airtank updating with overlays, pressure is [air.return_pressure()] out of [AIRTANK_MAX_SAFE_PRESSURE]"))
		if(air.return_pressure() <= AIRTANK_MAX_SAFE_PRESSURE * 0.1)
			gaugestate.icon_state = "[gauge_overlay]_10"
		else if(air.return_pressure() <= AIRTANK_MAX_SAFE_PRESSURE * 0.3)
			gaugestate.icon_state = "[gauge_overlay]_30"
		else if(air.return_pressure() <= AIRTANK_MAX_SAFE_PRESSURE * 0.5)
			gaugestate.icon_state = "[gauge_overlay]_50"
		else if(air.return_pressure() <= AIRTANK_MAX_SAFE_PRESSURE * 0.7)
			gaugestate.icon_state = "[gauge_overlay]_70"
		else
			gaugestate.icon_state = "[gauge_overlay]_90"
		//to_chat(world, span_notice("Gauge state is [gaugestate.icon_state]"))
	overlays += gaugestate
	. = overlays
	/*if(gaugestate in overlays)
		to_chat(world, span_nicegreen("It's in the fucking list"))
		if(gaugestate in .)
			to_chat(world, span_boldnicegreen("Double-checked and confirmed it's IN THE FUCKING LIST"))
		else
			to_chat(world, span_bolddanger("IT'S BEING HAUNTED THOUGH, NOT IN THE ACTUAL LIST"))
	else
		to_chat(world, span_danger("It's not in the overlays list despite being explicitly added to it"))*/
	return overlays

/obj/item/tank/internals/get_status_tab_item(mob/living/source, list/items)
	. = ..()
	update_appearance()

/obj/item/tank/internals/emergency_oxygen
	worn_icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items_suit.dmi'
	gauge_overlay = "emergency"

/obj/item/tank/internals/emergency_oxygen/engi
	worn_icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items_suit.dmi'
	gauge_overlay = "engi"

/obj/item/tank/internals/emergency_oxygen/double
	worn_icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items_suit.dmi'
	gauge_overlay = "double"
	worn_icon_state = "emergency_double"
	inhand_icon_state = "emergency_tst_tank"

/obj/item/tank/internals/generic/greyscale
	name = "generic gas tank"
	desc = "A generic gas tank supporting standard station paintjobs.  Good for demarkating special gas in bombs."

	greyscale_colors = "#0066FF#FFAA00"
	greyscale_config = /datum/greyscale_config/handheld_atmos_tank
	greyscale_config_worn = /datum/greyscale_config/handheld_atmos_tank/worn
	greyscale_config_inhand_left = /datum/greyscale_config/handheld_atmos_tank/worn/held_l
	greyscale_config_inhand_right = /datum/greyscale_config/handheld_atmos_tank/worn/held_r

	icon_state = "generic"
	worn_icon_state = "generic"
	inhand_icon_state = "generic"

/obj/item/tank/internals/generic/greyscale/populate_gas()
	return

/obj/item/tank/internals/plasma/greyscale
	name = "generic gas canister"
	desc = "A generic gas canister supporting standard station paintjobs.  Good for demarkating special gas in bombs.  This one's conductive, like plasma canisters."

	greyscale_colors = "#FF0066#FF6600"
	greyscale_config = /datum/greyscale_config/handheld_atmos_tank
	greyscale_config_worn = /datum/greyscale_config/handheld_atmos_tank/worn
	greyscale_config_inhand_left = /datum/greyscale_config/handheld_atmos_tank/worn/held_l
	greyscale_config_inhand_right = /datum/greyscale_config/handheld_atmos_tank/worn/held_r

	icon_state = "plasma"
	worn_icon_state = "plasma"
	inhand_icon_state = "plasma"

/obj/item/tank/internals/plasma/greyscale/populate_gas()
	return

/obj/item/tank/internals/emergency_oxygen/greyscale
	name = "generic emergency tank"
	desc = "A generic gas canister supporting standard station paintjobs.  This one's tiny, like emergency oxytanks- why would you use this over an extended-capacity one??"

	greyscale_colors = "#0066FF#AAFF00"
	greyscale_config = /datum/greyscale_config/handheld_atmos_tank
	greyscale_config_worn = /datum/greyscale_config/handheld_atmos_tank/worn
	greyscale_config_inhand_left = /datum/greyscale_config/handheld_atmos_tank/worn/held_l
	greyscale_config_inhand_right = /datum/greyscale_config/handheld_atmos_tank/worn/held_r

	icon_state = "emergency"
	worn_icon_state = "emergency"
	inhand_icon_state = "emergency"

/obj/item/tank/internals/emergency_oxygen/greyscale/populate_gas()
	return

/obj/item/tank/internals/emergency_oxygen/engi/greyscale
	name = "generic x-cap emergency tank"
	desc = "A generic gas canister supporting standard station paintjobs.  This one's tiny, like engineering's oxytanks- good for demarkating your Chadmosians' Pluoxium tanks of infinite breath."

	greyscale_colors = "#FF6600#66FF00"
	greyscale_config = /datum/greyscale_config/handheld_atmos_tank
	greyscale_config_worn = /datum/greyscale_config/handheld_atmos_tank/worn
	greyscale_config_inhand_left = /datum/greyscale_config/handheld_atmos_tank/worn/held_l
	greyscale_config_inhand_right = /datum/greyscale_config/handheld_atmos_tank/worn/held_r

	icon_state = "emergency_engi"
	worn_icon_state = "emergency_engi"
	inhand_icon_state = "emergency_engi"

/obj/item/tank/internals/emergency_oxygen/engi/greyscale/populate_gas()
	return

/obj/item/tank/internals/emergency_oxygen/double/greyscale
	name = "generic 2x-cap emergency tank"
	desc = "A generic gas canister supporting standard station paintjobs.  This one's made of two tiny ones, like engineering's oxytanks- filled with pluox you could last a whole dang shift off this thing!"

	greyscale_colors = "#FF6600#66FF00"
	greyscale_config = /datum/greyscale_config/handheld_atmos_tank
	greyscale_config_worn = /datum/greyscale_config/handheld_atmos_tank/worn
	greyscale_config_inhand_left = /datum/greyscale_config/handheld_atmos_tank/worn/held_l
	greyscale_config_inhand_right = /datum/greyscale_config/handheld_atmos_tank/worn/held_r

	icon_state = "emergency_double"
	worn_icon_state = "emergency_double"
	inhand_icon_state = "emergency_double"

/obj/item/tank/internals/emergency_oxygen/double/greyscale/populate_gas()
	return

// we dont need to touch these (Yet)
/obj/item/tank/internals/plasmaman
	icon = 'icons/obj/canisters.dmi'
	worn_icon = 'icons/mob/clothing/back.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/tanks_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tanks_righthand.dmi'

// nova bespoke tanks
/obj/item/tank/internals/nitrogen
	icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items.dmi'
	worn_icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items_suit.dmi'
	lefthand_file = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items_lh.dmi'
	righthand_file = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items_rh.dmi'
	gauge_overlay = "fullsize"
	icon_state = "nitrogen_big"
	inhand_icon_state = "nitrogen_big"
	worn_icon_state = "nitrogen_big"
	distribute_pressure = TANK_DEFAULT_RELEASE_PRESSURE * (10.0/16.0) //nitro lungs don't need as much

/obj/item/tank/internals/nitrogen/belt
	icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items.dmi'
	worn_icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items_suit.dmi'
	lefthand_file = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items_lh.dmi'
	righthand_file = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items_rh.dmi'
	gauge_overlay = "engi"
	icon_state = "nitrogen_extended"
	inhand_icon_state = "nitrogen_extended"
	worn_icon_state = "nitrogen_extended"
	volume = 6 //nudging to be in line with standard-size internals tanks, but buffing the included air to max pressure

/obj/item/tank/internals/nitrogen/belt/full/populate_gas()
	air_contents.assert_gas(/datum/gas/nitrogen)
	air_contents.gases[/datum/gas/nitrogen][MOLES] = AIRTANK_MAX_SAFE_PRESSURE*volume/(R_IDEAL_GAS_EQUATION*T20C)

/obj/item/tank/internals/nitrogen/belt/emergency
	gauge_overlay = "emergency"
	icon_state = "nitrogen"
	inhand_icon_state = "nitrogen"
	worn_icon_state = "nitrogen"

/obj/item/tank/internals/nitrogen/belt/emergency/populate_gas()
	air_contents.assert_gas(/datum/gas/nitrogen)
	air_contents.gases[/datum/gas/nitrogen][MOLES] = AIRTANK_MAX_SAFE_PRESSURE*volume/(R_IDEAL_GAS_EQUATION*T20C)



/// Greyscale setup
/datum/greyscale_config/handheld_atmos_tank
	expected_colors = 2
	name = "Handheld Atmos Tank"
	icon_file = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items.dmi'
	json_config = 'modular_skyraptor/modules/aesthetics/moremospherics/greyscales/tank_inventory.json'

/datum/greyscale_config/handheld_atmos_tank/worn
	name = "Worn Atmos Tank"
	icon_file = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items_suit.dmi'
	json_config = 'modular_skyraptor/modules/aesthetics/moremospherics/greyscales/tank_mob.json'

/datum/greyscale_config/handheld_atmos_tank/worn/held_l
	name = "Left Held Atmos Tank"
	icon_file = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items_lh.dmi'
	json_config = 'modular_skyraptor/modules/aesthetics/moremospherics/greyscales/tank_held.json'

/datum/greyscale_config/handheld_atmos_tank/worn/held_r
	name = "Right Held Atmos Tank"
	icon_file = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/atmosia_items_rh.dmi'
	json_config = 'modular_skyraptor/modules/aesthetics/moremospherics/greyscales/tank_held.json'



/// Crafting recipes to make the greyscale ones
/datum/crafting_recipe/greyscale_the_gascan
	name = "Repaint Gas Tank"
	result = /obj/item/tank/internals/generic/greyscale
	time = 5
	reqs = list(
		/obj/item/tank/internals/generic = 1,
	)
	category = CAT_ATMOSPHERIC
	tool_behaviors = list()

/datum/crafting_recipe/greyscale_the_gascan/oxy
	reqs = list(
		/obj/item/tank/internals/oxygen = 1,
	)

/datum/crafting_recipe/greyscale_the_gascan/em
	name = "Repaint Emergency Tank"
	result = /obj/item/tank/internals/emergency_oxygen/greyscale
	reqs = list(
		/obj/item/tank/internals/emergency_oxygen = 1,
	)

/datum/crafting_recipe/greyscale_the_gascan/em/engi
	name = "Repaint Engi Tank"
	result = /obj/item/tank/internals/emergency_oxygen/engi/greyscale
	reqs = list(
		/obj/item/tank/internals/emergency_oxygen/engi = 1,
	)

/datum/crafting_recipe/greyscale_the_gascan/em/double
	name = "Repaint Double-Engi Tank"
	result = /obj/item/tank/internals/emergency_oxygen/double/greyscale
	reqs = list(
		/obj/item/tank/internals/emergency_oxygen/double = 1,
	)

/datum/crafting_recipe/double_oxytank_creation
	name = "Create Double Oxy-Tank"
	result = /obj/item/tank/internals/emergency_oxygen/double
	time = 5
	reqs = list(
		/obj/item/tank/internals/emergency_oxygen/engi = 2,
		/obj/item/stack/sticky_tape = 1,
	)
	category = CAT_ATMOSPHERIC
	tool_behaviors = list()

/datum/crafting_recipe/double_oxytank_creation/fromgreyscale
	name = "Create Repaintable Double Oxy-Tank"
	result = /obj/item/tank/internals/emergency_oxygen/double/greyscale
	time = 5
	reqs = list(
		/obj/item/tank/internals/emergency_oxygen/engi/greyscale = 2,
		/obj/item/stack/sticky_tape = 1,
	)
	category = CAT_ATMOSPHERIC
	tool_behaviors = list()

/datum/crafting_recipe/repainting_kit_creation
	name = "Repainting Kit Sidegrade"
	result = /obj/item/repainting_kit
	time = 3
	reqs = list(
		/obj/item/mod/paint = 1,
		/obj/item/toy/crayon/spraycan = 1,
	)
	category = CAT_ENTERTAINMENT
	tool_behaviors = list()



/// THE BIGGEST QOL FEATURE: re-greyscale ANY greyscalable item with the paintkit, or color matrix stuff at will
/obj/item/repainting_kit
	name = "Repainting Kit"
	desc = "Restyle anything in your grasp with this innovative upgrade on the MOD Paint Kit!"
	icon = 'icons/obj/clothing/modsuit/mod_construction.dmi'
	icon_state = "paintkit"

	var/obj/item/repainting_item = null
	var/obj/item/regreyscale_item = null

	var/atom/movable/screen/map_view/proxy_view
	var/list/current_color

/obj/item/repainting_kit/Initialize(mapload)
	. = ..()
	current_color = COLOR_MATRIX_IDENTITY

/obj/item/repainting_kit/examine(mob/user)
	. = ..()
	. += span_notice("<b>Left-click</b> a GAGS-based item to alter its GREYSCALE COLORS.")
	. += span_notice("<b>Right-click</b> any item to apply a COLOR MATRIX to it.")

/obj/item/repainting_kit/pre_attack(atom/attacked_atom, mob/living/user, params)
	repainting_item = null //force it to null if needed
	regreyscale_item = null
	if(!istype(attacked_atom, /obj/item/))
		return ..()
	if(istype(attacked_atom, /obj/item/mod/control))
		return ..()
	var/obj/item/smacked_item = attacked_atom
	if(smacked_item.greyscale_config != null)
		regreyscale_item = smacked_item
		var/atom/fake_atom = smacked_item
		var/list/allowed_configs = list()
		var/config = initial(fake_atom.greyscale_config)
		if(!config)
			return
		allowed_configs += "[config]"

		var/datum/greyscale_modify_menu/menu = new(
			smacked_item, user, allowed_configs, CALLBACK(src, PROC_REF(recolor_gags)),
			starting_icon_state=initial(fake_atom.icon_state),
			starting_config=initial(fake_atom.greyscale_config),
			starting_colors=initial(fake_atom.greyscale_colors)
		)
		menu.ui_interact(user)
		return TRUE
	else
		return ..()
	return ..()

/obj/item/repainting_kit/proc/recolor_gags(datum/greyscale_modify_menu/menu)
	regreyscale_item.set_greyscale(menu.split_colors)

/obj/item/repainting_kit/pre_attack_secondary(atom/attacked_atom, mob/living/user, params)
	if(!istype(attacked_atom, /obj/item/))
		return ..()
	if(istype(attacked_atom, /obj/item/mod/control))
		return ..()
	var/obj/item/smacked_item = attacked_atom
	if(repainting_item)
		repainting_item = null
	repainting_item = smacked_item

	proxy_view = new()
	proxy_view.generate_view("color_matrix_proxy_[REF(user.client)]")

	proxy_view.appearance = repainting_item.appearance
	proxy_view.color = null
	proxy_view.display_to(user)
	ui_interact(user)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/item/repainting_kit/ui_interact(mob/user, datum/tgui/ui)
	if(!repainting_item)
		return
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "MODpaint", name)
		ui.open()

/obj/item/repainting_kit/ui_host()
	if(repainting_item)
		return repainting_item
	else
		to_chat(world, span_userdanger("SKYRAPTOR DEBUG WARNING: Tried to use a paintkit's UI when there was no MOD or regular item targeted!"))
		return null

/obj/item/repainting_kit/ui_close(mob/user)
	. = ..()
	repainting_item = null
	QDEL_NULL(proxy_view)
	current_color = COLOR_MATRIX_IDENTITY

/obj/item/repainting_kit/ui_status(mob/user)
	if(repainting_item)
		if(check_menu(repainting_item, user))
			return ..()
	return UI_CLOSE

/obj/item/repainting_kit/ui_static_data(mob/user)
	var/list/data = list()
	data["mapRef"] = proxy_view.assigned_map
	return data

/obj/item/repainting_kit/ui_data(mob/user)
	var/list/data = list()
	data["currentColor"] = current_color
	return data

/obj/item/repainting_kit/ui_act(action, list/params)
	. = ..()
	if(.)
		return
	switch(action)
		if("transition_color")
			current_color = params["color"]
			animate(proxy_view, time = 0.5 SECONDS, color = current_color)
		if("confirm")
			if(length(current_color) != 20) //20 is the length of a matrix identity list
				return
			for(var/color_value in current_color)
				if(isnum(color_value))
					continue
				return
			var/total_color_value = 0
			var/list/total_colors = current_color.Copy()
			total_colors.Cut(13, length(total_colors)) // 13 to 20 are just a and c, dont want to count them
			var/red_value = current_color[1] + current_color[5] + current_color[9] //rr + gr + br
			var/green_value = current_color[2] + current_color[6] + current_color[10] //rg + gg + bg
			var/blue_value = current_color[3] + current_color[7] + current_color[11] //rb + gb + bb
			if(red_value > MODPAINT_MAX_SECTION_COLORS)
				balloon_alert(usr, "total red too high! ([red_value*100]%/[MODPAINT_MAX_SECTION_COLORS*100]%)")
				return
			else if(red_value < MODPAINT_MIN_SECTION_COLORS)
				balloon_alert(usr, "total red too low! ([red_value*100]%/[MODPAINT_MIN_SECTION_COLORS*100]%)")
				return
			if(green_value > MODPAINT_MAX_SECTION_COLORS)
				balloon_alert(usr, "total green too high! ([green_value*100]%/[MODPAINT_MAX_SECTION_COLORS*100]%)")
				return
			else if(green_value < MODPAINT_MIN_SECTION_COLORS)
				balloon_alert(usr, "total green too low! ([green_value*100]%/[MODPAINT_MIN_SECTION_COLORS*100]%)")
				return
			if(blue_value > MODPAINT_MAX_SECTION_COLORS)
				balloon_alert(usr, "total blue too high! ([blue_value*100]%/[MODPAINT_MAX_SECTION_COLORS*100]%)")
				return
			else if(blue_value < MODPAINT_MIN_SECTION_COLORS)
				balloon_alert(usr, "total blue too low! ([blue_value*100]%/[MODPAINT_MIN_SECTION_COLORS*100]%)")
				return
			for(var/color_value in total_colors)
				total_color_value += color_value
				if(color_value > MODPAINT_MAX_COLOR_VALUE)
					balloon_alert(usr, "one of colors too high! ([color_value*100]%/[MODPAINT_MAX_COLOR_VALUE*100]%")
					return
				else if(color_value < MODPAINT_MIN_COLOR_VALUE)
					balloon_alert(usr, "one of colors too low! ([color_value*100]%/[MODPAINT_MIN_COLOR_VALUE*100]%")
					return
			if(total_color_value > MODPAINT_MAX_OVERALL_COLORS)
				balloon_alert(usr, "total colors too high! ([total_color_value*100]%/[MODPAINT_MAX_OVERALL_COLORS*100]%)")
				return
			else if(total_color_value < MODPAINT_MIN_OVERALL_COLORS)
				balloon_alert(usr, "total colors too low! ([total_color_value*100]%/[MODPAINT_MIN_OVERALL_COLORS*100]%)")
				return
			if(repainting_item) //sanity check: SKYRAPTOR EDIT
				repainting_item.color = current_color
			SStgui.close_uis(src)

/obj/item/repainting_kit/proc/check_menu(obj/item/goodie, mob/user)
	if(user.incapacitated() || !user.is_holding(src) || !goodie)
		repainting_item = null
		return FALSE
	return TRUE

#undef AIRTANK_MAX_SAFE_PRESSURE
#undef MODPAINT_MAX_COLOR_VALUE
#undef MODPAINT_MIN_COLOR_VALUE
#undef MODPAINT_MAX_SECTION_COLORS
#undef MODPAINT_MIN_SECTION_COLORS
#undef MODPAINT_MAX_OVERALL_COLORS
#undef MODPAINT_MIN_OVERALL_COLORS



/// Dirty fix until TG gets the fucking attack chains in order
/obj/item/repainting_kit/melee_attack_chain(mob/user, atom/target, params)
	//Proxy replaces src cause it returns an atom that will attack the target on our behalf
	var/obj/item/source_atom = get_proxy_attacker_for(target, user)
	if(source_atom != src) //if we are someone else then call that attack chain else we can proceed with the usual stuff
		return source_atom.melee_attack_chain(user, target, params)

	var/list/modifiers = params2list(params)
	var/is_right_clicking = LAZYACCESS(modifiers, RIGHT_CLICK)

	// At this point it means we're not doing a non-combat interaction so let's just try to bash it

	var/pre_attack_result
	if (is_right_clicking)
		switch (pre_attack_secondary(target, user, params))
			if (SECONDARY_ATTACK_CALL_NORMAL)
				pre_attack_result = pre_attack(target, user, params)
			if (SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
				return TRUE
			if (SECONDARY_ATTACK_CONTINUE_CHAIN)
				EMPTY_BLOCK_GUARD // Normal behavior
			else
				CRASH("pre_attack_secondary must return an SECONDARY_ATTACK_* define, please consult code/__DEFINES/combat.dm")
	else
		pre_attack_result = pre_attack(target, user, params)

	if(pre_attack_result)
		return TRUE

	// At this point the attack is really about to happen

	var/attackby_result
	if (is_right_clicking)
		switch (target.attackby_secondary(src, user, params))
			if (SECONDARY_ATTACK_CALL_NORMAL)
				attackby_result = target.attackby(src, user, params)
			if (SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
				return TRUE
			if (SECONDARY_ATTACK_CONTINUE_CHAIN)
				EMPTY_BLOCK_GUARD // Normal behavior
			else
				CRASH("attackby_secondary must return an SECONDARY_ATTACK_* define, please consult code/__DEFINES/combat.dm")
	else
		attackby_result = target.attackby(src, user, params)

	if (attackby_result)
		// This means the attack failed or was handled for whatever reason
		return TRUE

	// At this point it means the attack was "successful", or at least unhandled, in some way
	// This can mean nothing happened, this can mean the target took damage, etc.

	return TRUE
