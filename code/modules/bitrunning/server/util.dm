#define REDACTED "???"
#define MAX_DISTANCE 4 // How far crates can spawn from the server

/// Resets the cooldown state and updates icons
/obj/machinery/quantum_server/proc/cool_off()
	is_ready = TRUE
	update_appearance()
	radio.talk_into(src, "Thermal systems within operational parameters. Proceeding to domain configuration.", RADIO_CHANNEL_SUPPLY)

/// Attempts to connect to a quantum console
/obj/machinery/quantum_server/proc/find_console()
	var/obj/machinery/computer/quantum_console/console = console_ref?.resolve()
	if(console)
		return console

	for(var/direction in GLOB.cardinals)
		var/obj/machinery/computer/quantum_console/nearby_console = locate(/obj/machinery/computer/quantum_console, get_step(src, direction))
		if(nearby_console)
			console_ref = WEAKREF(nearby_console)
			nearby_console.server_ref = WEAKREF(src)
			return nearby_console

/// Compiles a list of available domains.
/obj/machinery/quantum_server/proc/get_available_domains()
	var/list/levels = list()

	for(var/datum/lazy_template/virtual_domain/domain as anything in available_domains)
		if(initial(domain.test_only))
			continue
		var/can_view = initial(domain.difficulty) < scanner_tier && initial(domain.cost) <= points + 5
		var/can_view_reward = initial(domain.difficulty) < (scanner_tier + 1) && initial(domain.cost) <= points + 3

		levels += list(list(
			"cost" = initial(domain.cost),
			"desc" = can_view ? initial(domain.desc) : "Limited scanning capabilities. Cannot infer domain details.",
			"difficulty" = initial(domain.difficulty),
			"id" = initial(domain.key),
			"name" = can_view ? initial(domain.name) : REDACTED,
			"reward" = can_view_reward ? initial(domain.reward_points) : REDACTED,
		))

	return levels

/// If there are hosted minds, attempts to get a list of their current virtual bodies w/ vitals
/obj/machinery/quantum_server/proc/get_avatar_data()
	var/list/hosted_avatars = list()

	for(var/datum/weakref/avatar_ref in avatar_connection_refs)
		var/datum/component/avatar_connection/connection = avatar_ref.resolve()
		if(isnull(connection))
			avatar_connection_refs.Remove(connection)
			continue

		var/mob/living/creature = connection.parent
		var/mob/living/pilot = connection.old_body_ref?.resolve()

		hosted_avatars += list(list(
			"health" = creature.health,
			"name" = creature.name,
			"pilot" = pilot,
			"brute" = creature.get_current_damage_of_type(BRUTE),
			"burn" = creature.get_current_damage_of_type(BURN),
			"tox" = creature.get_current_damage_of_type(TOX),
			"oxy" = creature.get_current_damage_of_type(OXY),
		))

	return hosted_avatars

/// Gets a random available domain given the current points. Weighted towards higher cost domains.
/obj/machinery/quantum_server/proc/get_random_domain_id()
	if(points < 1)
		return

	var/list/random_domains = list()
	var/total_cost = 0

	for(var/datum/lazy_template/virtual_domain/available as anything in subtypesof(/datum/lazy_template/virtual_domain))
		var/init_cost = initial(available.cost)
		if(!initial(available.test_only) && init_cost > 0 && init_cost < 4 && init_cost <= points)
			random_domains += list(list(
				cost = init_cost,
				id = initial(available.key),
			))

	var/random_value = rand(0, total_cost)
	var/accumulated_cost = 0

	for(var/available as anything in random_domains)
		accumulated_cost += available["cost"]
		if(accumulated_cost >= random_value)
			domain_randomized = TRUE
			return available["id"]

/// Gets all mobs originally generated by the loaded domain and returns a list that are capable of being antagged
/obj/machinery/quantum_server/proc/get_valid_domain_targets()
	// A: No one is playing
	// B: The domain is not loaded
	// C: The domain is shutting down
	// D: There are no mobs
	if(!length(avatar_connection_refs) || isnull(generated_domain) || !is_ready || !is_operational || !length(mutation_candidate_refs))
		return list()

	for(var/datum/weakref/creature_ref as anything in mutation_candidate_refs)
		var/mob/living/creature = creature_ref.resolve()
		if(isnull(creature) || creature.mind)
			mutation_candidate_refs.Remove(creature_ref)

	return shuffle(mutation_candidate_refs)

/// Locates any turfs with forges on them
/obj/machinery/quantum_server/proc/get_nearby_forges()
	var/list/obj/machinery/byteforge/nearby_forges = list()

	for(var/obj/machinery/byteforge/forge in oview(MAX_DISTANCE, src))
		nearby_forges += forge

	return nearby_forges

/// Finds any mobs with minds in the zones and gives them the bad news
/obj/machinery/quantum_server/proc/notify_spawned_threats()
	for(var/datum/weakref/baddie_ref as anything in spawned_threat_refs)
		var/mob/living/baddie = baddie_ref.resolve()
		if(isnull(baddie) || baddie.stat >= UNCONSCIOUS || isnull(baddie.mind))
			continue

		baddie.throw_alert(
			ALERT_BITRUNNER_RESET,
			/atom/movable/screen/alert/bitrunning/qserver_threat_deletion,
			new_master = src,
		)

		to_chat(baddie, span_userdanger("You have been flagged for deletion! Thank you for your service."))

/// Do some magic teleport sparks
/obj/machinery/quantum_server/proc/spark_at_location(obj/cache)
	playsound(cache, 'sound/magic/blink.ogg', 50, TRUE)
	var/datum/effect_system/spark_spread/quantum/sparks = new()
	sparks.set_up(5, 1, get_turf(cache))
	sparks.start()

#undef REDACTED
#undef MAX_DISTANCE
