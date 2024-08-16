/// Dynamically calculate nightshift brightness. How TG does it is painful to modify.
#define NIGHTSHIFT_LIGHT_MODIFIER 0.15
#define NIGHTSHIFT_COLOR_MODIFIER 0.10
#define LIGHT_ON_DELAY_UPPER (2 SECONDS)
#define LIGHT_ON_DELAY_LOWER (0.25 SECONDS)

/atom
	light_power = 1.25

/obj/machinery/light
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/lights/icons/lighting.dmi'
	overlay_icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/lights/icons/lighting_overlay.dmi'
	brightness = 6.5
	fire_brightness = 8
	fire_colour = "#ff5555"
	bulb_colour = LIGHT_COLOR_FAINT_BLUE
	bulb_power = 1.15
	nightshift_light_color = LIGHT_COLOR_FAINT_BLUE // we don't have dynamic nightshift like Skrat so this has to suffice
	//god y'all why did you have to make so much of that shit nonmodular
	bulb_low_power_colour = "#ff9955"
	bulb_low_power_brightness_mul = 0.75
	bulb_low_power_pow_min = 0.75
	bulb_emergency_colour = "#5599ff"
	bulb_major_emergency_brightness_mul = 1.1
	power_consumption_rate = 5.62
	var/maploaded = FALSE //So we don't have a lot of stress on startup.
	var/turning_on = FALSE //More stress stuff.
	var/constant_flickering = FALSE // Are we always flickering?
	var/flicker_timer = null
	var/roundstart_flicker = FALSE

	///Because colored lighting is complicated :(
	var/mutable_appearance/light_overlay
	var/mutable_appearance/lightmask_overlay

/obj/machinery/light/floor
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/lights/icons/lighting.dmi'
	overlay_icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/lights/icons/lighting_overlay.dmi'

/obj/machinery/light/set_on(turn_on)
	spawn(rand(LIGHT_ON_DELAY_LOWER, LIGHT_ON_DELAY_UPPER))
		. = ..()
		if(turn_on && status == LIGHT_OK)
			playsound(src.loc, 'modular_skyraptor/modules/aesthetics/inherited_skyrat/lights/sound/light_on.ogg', 65, 1)

/obj/machinery/light/proc/start_flickering()
	on = FALSE
	update(FALSE, TRUE, FALSE)

	constant_flickering = TRUE

	flicker_timer = addtimer(CALLBACK(src, PROC_REF(flicker_on)), rand(5, 10))

/obj/machinery/light/proc/stop_flickering()
	constant_flickering = FALSE

	if(flicker_timer)
		deltimer(flicker_timer)
		flicker_timer = null

	set_on(has_power())

/obj/machinery/light/proc/alter_flicker(enable = TRUE)
	if(!constant_flickering)
		return
	if(has_power())
		on = enable
		update(FALSE, TRUE, FALSE)

/obj/machinery/light/proc/flicker_on()
	alter_flicker(TRUE)
	flicker_timer = addtimer(CALLBACK(src, PROC_REF(flicker_off)), rand(5, 10))

/obj/machinery/light/proc/flicker_off()
	alter_flicker(FALSE)
	flicker_timer = addtimer(CALLBACK(src, PROC_REF(flicker_on)), rand(5, 50))

/obj/machinery/light/Initialize(mapload = TRUE)
	. = ..()
	if(on)
		maploaded = TRUE

	if(roundstart_flicker)
		start_flickering()

/obj/item/light/tube
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/lights/icons/lighting.dmi'


/obj/machinery/light/multitool_act(mob/living/user, obj/item/multitool)
	if(!constant_flickering)
		balloon_alert(user, "ballast is already working!")
		return ITEM_INTERACT_SUCCESS

	balloon_alert(user, "repairing the ballast...")
	if(do_after(user, 2 SECONDS, src))
		stop_flickering()
		balloon_alert(user, "ballast repaired!")
		return ITEM_INTERACT_SUCCESS
	return ..()


//completely overriding this is ill-advised but here we are
/obj/machinery/light/update_icon_state()
	var/return_valu = ..()
	switch(status) // set icon_states
		if(LIGHT_OK)
			var/area/local_area = get_room_area(src)
			if((local_area?.fire))
				icon_state = "[base_state]_fire"
			else if(low_power_mode)
				icon_state = "[base_state]_lpower"
			else if(major_emergency)
				icon_state = "[base_state]_emergency"
			else
				icon_state = "[base_state]"
		if(LIGHT_EMPTY)
			icon_state = "[base_state]-empty"
		if(LIGHT_BURNED)
			icon_state = "[base_state]-burned"
		if(LIGHT_BROKEN)
			icon_state = "[base_state]-broken"
	return return_valu

//completely overriding THIS is ill-advised TOO but here we are
/obj/machinery/light/update_overlays()
	. = ..()
	cut_overlays()
	//kill normal overlays and then run the normal check
	if(light_range < 1) /// this is a weird check but it should capture edge-cases
		return
	//make sure our light_overlay appearance is setup
	if(light_overlay == null)
		light_overlay = new()
	if(lightmask_overlay == null)
		lightmask_overlay = new()
	//set its icon state and color then add it
	var/area/local_area = get_room_area()
	light_overlay.icon_state = "[base_state]"
	light_overlay.icon = overlay_icon
	if(low_power_mode || major_emergency || (local_area?.fire))
		light_overlay.icon_state = "[base_state]_emergency"
	if(nightshift_enabled)
		light_overlay.icon_state = "[base_state]_nightshift"
	light_overlay.color = light_color
	lightmask_overlay.icon_state = light_overlay.icon_state
	lightmask_overlay.color = GLOB.emissive_color
	//SET_PLANE_EXPLICIT(light_overlay, ABOVE_LIGHTING_PLANE, src) //gloooooooow
	SET_PLANE_EXPLICIT(lightmask_overlay, EMISSIVE_PLANE, src) //gloooooooow
	add_overlay(light_overlay)
	add_overlay(lightmask_overlay)

/obj/machinery/light/update(trigger = TRUE)
	. = ..()
	update_overlays()

#undef NIGHTSHIFT_LIGHT_MODIFIER
#undef NIGHTSHIFT_COLOR_MODIFIER
#undef LIGHT_ON_DELAY_UPPER
#undef LIGHT_ON_DELAY_LOWER
