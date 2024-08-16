/obj/item/pipe
	icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/pipes/pipe_item.dmi'



/obj/machinery/meter
	icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/pipes/meter.dmi'

/obj/machinery/atmospherics/components
	underlay_icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/pipes/pipe_underlays.dmi'

/obj/machinery/atmospherics/pipe/bridge_pipe
	icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/pipes/bridge_pipe.dmi'

/obj/machinery/atmospherics/pipe/layer_manifold
	icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/pipes/manifold.dmi'
	underlay_icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/pipes/layer_manifold_underlays.dmi'

/obj/machinery/atmospherics/pipe/color_adapter
	icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/pipes/color_adapter.dmi'
	manifold_icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/pipes/manifold.dmi'



/obj/machinery/atmospherics/pipe
	bitmask_icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/pipes/pipes_bitmask.dmi'

/obj/machinery/atmospherics/pipe/smart
	icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/pipes/simple.dmi'

/obj/machinery/atmospherics/pipe/smart/simple
	icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/pipes/simple.dmi'

/obj/machinery/atmospherics/pipe/smart/manifold
	icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/pipes/manifold.dmi'

/obj/machinery/atmospherics/pipe/smart/manifold4w
	icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/pipes/manifold.dmi'

/obj/effect/overlay/cap_visual
	icon = 'modular_skyraptor/modules/aesthetics/moremospherics/icons/pipes/pipes_bitmask.dmi'

/datum/asset/spritesheet/pipes/create_spritesheets()
	///NAAKAS-LOUNGE EDIT: pipe_item redir to aestheticsmodule
	for (var/each in list('modular_skyraptor/modules/aesthetics/moremospherics/icons/pipes/pipe_item.dmi', 'modular_skyraptor/modules/aesthetics/inherited_skyrat/disposals/icons/disposals.dmi', 'icons/obj/pipes_n_cables/transit_tube.dmi', 'modular_skyraptor/modules/aesthetics/oldnewsurgery/hydrochem/fluid_ducts.dmi'))
		InsertAll("", each, GLOB.alldirs)
