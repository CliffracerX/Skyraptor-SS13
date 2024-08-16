/obj/structure/window/fulltile
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/windows/icons/window.dmi'
	canSmoothWith = SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS

/obj/structure/window/fulltile/diagonal
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_DIAGONAL_CORNERS

/obj/structure/window/fulltile/diagonal/unanchored
	anchored = FALSE

/obj/structure/window/reinforced/fulltile
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/windows/icons/r_window.dmi'
	canSmoothWith = SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS

/obj/structure/window/reinforced/fulltile/diagonal
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_DIAGONAL_CORNERS

/obj/structure/window/reinforced/fulltile/diagonal/unanchored
	anchored = FALSE
	state = WINDOW_OUT_OF_FRAME

/obj/structure/window/reinforced/tinted/fulltile
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/windows/icons/r_window_tinted.dmi'
	icon_state = "reinforced_window-0"
	base_icon_state = "reinforced_window"
	canSmoothWith = SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS

/obj/structure/window/reinforced/tinted/fulltile/diagonal
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_DIAGONAL_CORNERS

/obj/structure/window/reinforced/tinted/fulltile/diagonal/unanchored
	anchored = FALSE
	state = WINDOW_OUT_OF_FRAME

/obj/structure/window/plasma/fulltile
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/windows/icons/window_plasma.dmi'
	icon_state = "window-0"
	base_icon_state = "window"
	canSmoothWith = SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS

/obj/structure/window/plasma/fulltile/diagonal
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_DIAGONAL_CORNERS

/obj/structure/window/plasma/fulltile/diagonal/unanchored
	anchored = FALSE

/obj/structure/window/reinforced/plasma/fulltile
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/windows/icons/r_window_plasma.dmi'
	icon_state = "reinforced_window-0"
	base_icon_state = "reinforced_window"
	canSmoothWith = SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS

/obj/structure/window/reinforced/plasma/fulltile/diagonal
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_DIAGONAL_CORNERS

/obj/structure/window/reinforced/plasma/fulltile/diagonal/unanchored
	anchored = FALSE
	state = WINDOW_OUT_OF_FRAME



/// Bespoke addition: uranium-glass windows, based on SS14
/obj/structure/window/uranium/fulltile
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/windows/icons/window_uranium.dmi'
	icon_state = "window-0"
	base_icon_state = "window"
	max_integrity = 600
	fulltile = TRUE
	flags_1 = PREVENT_CLICK_UNDER_1
	obj_flags = CAN_BE_HIT
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_WINDOW_FULLTILE
	canSmoothWith = SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS
	glass_amount = 2

/obj/structure/window/uranium/fulltile/unanchored
	anchored = FALSE

/obj/structure/window/uranium/fulltile/diagonal
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_DIAGONAL_CORNERS

/obj/structure/window/uranium/fulltile/diagonal/unanchored
	anchored = FALSE

/obj/structure/window/reinforced/uranium/fulltile
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/windows/icons/r_window_uranium.dmi'
	icon_state = "reinforced_window-0"
	base_icon_state = "reinforced_window"
	state = RWINDOW_SECURE
	max_integrity = 1500
	fulltile = TRUE
	flags_1 = PREVENT_CLICK_UNDER_1
	obj_flags = CAN_BE_HIT
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_WINDOW_FULLTILE
	canSmoothWith = SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS
	glass_amount = 2

/obj/structure/window/reinforced/uranium/fulltile/unanchored
	anchored = FALSE
	state = WINDOW_OUT_OF_FRAME

/obj/structure/window/reinforced/uranium/fulltile/diagonal
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_DIAGONAL_CORNERS

/obj/structure/window/reinforced/uranium/fulltile/diagonal/unanchored
	anchored = FALSE
	state = WINDOW_OUT_OF_FRAME
