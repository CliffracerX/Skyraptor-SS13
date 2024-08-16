/turf/open/floor
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/floors/icons/floors.dmi'

//Removes redundant textured stuff from this radial, as all of ours are textured by default
/obj/item/stack/tile/iron
	tile_reskin_types = list(
		/obj/item/stack/tile/iron,
		/obj/item/stack/tile/iron/edge,
		/obj/item/stack/tile/iron/half,
		/obj/item/stack/tile/iron/corner,
		/obj/item/stack/tile/iron/large,
		/obj/item/stack/tile/iron/small,
		/obj/item/stack/tile/iron/diagonal,
		/obj/item/stack/tile/iron/herringbone,
		/obj/item/stack/tile/iron/dark,
		/obj/item/stack/tile/iron/dark/smooth_edge,
		/obj/item/stack/tile/iron/dark/smooth_half,
		/obj/item/stack/tile/iron/dark/smooth_corner,
		/obj/item/stack/tile/iron/dark/smooth_large,
		/obj/item/stack/tile/iron/dark/small,
		/obj/item/stack/tile/iron/dark/diagonal,
		/obj/item/stack/tile/iron/dark/herringbone,
		/obj/item/stack/tile/iron/dark_side,
		/obj/item/stack/tile/iron/dark_corner,
		/obj/item/stack/tile/iron/checker,
		/obj/item/stack/tile/iron/white,
		/obj/item/stack/tile/iron/white/smooth_edge,
		/obj/item/stack/tile/iron/white/smooth_half,
		/obj/item/stack/tile/iron/white/smooth_corner,
		/obj/item/stack/tile/iron/white/smooth_large,
		/obj/item/stack/tile/iron/white/small,
		/obj/item/stack/tile/iron/white/diagonal,
		/obj/item/stack/tile/iron/white/herringbone,
		/obj/item/stack/tile/iron/white_side,
		/obj/item/stack/tile/iron/white_corner,
		/obj/item/stack/tile/iron/cafeteria,
		/obj/item/stack/tile/iron/recharge_floor,
		/obj/item/stack/tile/iron/smooth,
		/obj/item/stack/tile/iron/smooth_edge,
		/obj/item/stack/tile/iron/smooth_half,
		/obj/item/stack/tile/iron/smooth_corner,
		/obj/item/stack/tile/iron/smooth_large,
		/obj/item/stack/tile/iron/terracotta,
		/obj/item/stack/tile/iron/terracotta/small,
		/obj/item/stack/tile/iron/terracotta/diagonal,
		/obj/item/stack/tile/iron/terracotta/herringbone,
		/obj/item/stack/tile/iron/kitchen,
		/obj/item/stack/tile/iron/kitchen/small,
		/obj/item/stack/tile/iron/kitchen/diagonal,
		/obj/item/stack/tile/iron/kitchen/herringbone,
		/obj/item/stack/tile/iron/chapel,
		/obj/item/stack/tile/iron/showroomfloor,
		/obj/item/stack/tile/iron/solarpanel,
		/obj/item/stack/tile/iron/freezer,
		/obj/item/stack/tile/iron/grimy,
		/obj/item/stack/tile/iron/sepia,
		/obj/item/stack/tile/iron/pavement, /// NAAKAS-LOUNGE ADD BEGIN
		/obj/item/stack/tile/iron/dark/pavement,
		/obj/item/stack/tile/iron/white/pavement, /// NAAKAS-LOUNGE ADD END
	)

/turf/open/indestructible/cobble
	name = "cobblestone path"
	desc = "A simple but beautiful path made of various sized stones."
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/floors/icons/floors.dmi'
	icon_state = "cobble"
	baseturfs = /turf/open/indestructible/cobble
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/indestructible/cobble/side
	icon_state = "cobble_side"

/turf/open/indestructible/cobble/corner
	icon_state = "cobble_corner"



//Wood
/obj/item/stack/tile/wood
	tile_reskin_types = list(
		/obj/item/stack/tile/wood,
		/obj/item/stack/tile/wood/large,
		/obj/item/stack/tile/wood/tile,
		/obj/item/stack/tile/wood/parquet,
		/obj/item/stack/tile/wood/birch,
		/obj/item/stack/tile/wood/large/birch,
		/obj/item/stack/tile/wood/tile/birch,
		/obj/item/stack/tile/wood/parquet/birch,
	)

/obj/item/stack/tile/wood/birch
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/floors/icons/tiles.dmi'
	name = "birchwood floor tile"
	singular_name = "birchwood floor tile"
	desc = "An easy to fit wood floor til, made from birch. Use while in your hand to change what pattern you want."
	icon_state = "tile-wood"
	turf_type = /turf/open/floor/wood/birch
	merge_type = /obj/item/stack/tile/wood/birch

/obj/item/stack/tile/wood/parquet/birch
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/floors/icons/tiles.dmi'
	name = "parquet birchwood floor tile"
	singular_name = "parquet birchwood floor tile"
	icon_state = "tile-wood_parquet"
	turf_type = /turf/open/floor/wood/parquet/birch
	merge_type = /obj/item/stack/tile/wood/parquet/birch

/obj/item/stack/tile/wood/large/birch
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/floors/icons/tiles.dmi'
	name = "large birchwood floor tile"
	singular_name = "large birchwood floor tile"
	icon_state = "tile-wood_large"
	turf_type = /turf/open/floor/wood/large/birch
	merge_type = /obj/item/stack/tile/wood/large/birch

/obj/item/stack/tile/wood/tile/birch
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/floors/icons/tiles.dmi'
	name = "tiled birchwood floor tile"
	singular_name = "tiled birchwood floor tile"
	icon_state = "tile-wood_tile"
	turf_type = /turf/open/floor/wood/tile/birch
	merge_type = /obj/item/stack/tile/wood/tile/birch


//Naaka's Lounge edit
/turf/open/floor/wood/birch
	icon_state = "birchwood"
	floor_tile = /obj/item/stack/tile/wood/birch

/turf/open/floor/wood/tile/birch
	icon_state = "birchwood_tile"
	floor_tile = /obj/item/stack/tile/wood/tile/birch

/turf/open/floor/wood/parquet/birch
	icon_state = "birchwood_parquet"
	floor_tile = /obj/item/stack/tile/wood/parquet/birch

/turf/open/floor/wood/large/birch
	icon_state = "birchwood_large"
	floor_tile = /obj/item/stack/tile/wood/large/birch



/// ADDITION: pavement tiles
/obj/item/stack/tile/iron/pavement
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/floors/icons/tiles.dmi'
	name = "pavement tile"
	singular_name = "pavement floor tile"
	icon_state = "tile_pavement"
	turf_type = /turf/open/floor/iron/pavement
	merge_type = /obj/item/stack/tile/iron/pavement

/obj/item/stack/tile/iron/dark/pavement
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/floors/icons/tiles.dmi'
	name = "dark pavement tile"
	singular_name = "dark pavement floor tile"
	icon_state = "tile_dark_pavement"
	turf_type = /turf/open/floor/iron/dark/pavement
	merge_type = /obj/item/stack/tile/iron/dark/pavement

/obj/item/stack/tile/iron/white/pavement
	icon = 'modular_skyraptor/modules/aesthetics/inherited_skyrat/floors/icons/tiles.dmi'
	name = "white pavement tile"
	singular_name = "white pavement floor tile"
	icon_state = "tile_white_pavement"
	turf_type = /turf/open/floor/iron/white/pavement
	merge_type = /obj/item/stack/tile/iron/white/pavement

/turf/open/floor/iron/pavement
	icon_state = "pavement"
	base_icon_state = "pavement"
	floor_tile = /obj/item/stack/tile/iron/pavement

/turf/open/floor/iron/dark/pavement
	icon_state = "dark_pavement"
	base_icon_state = "dark_pavement"
	floor_tile = /obj/item/stack/tile/iron/dark/pavement

/turf/open/floor/iron/white/pavement
	icon_state = "white_pavement"
	base_icon_state = "white_pavement"
	floor_tile = /obj/item/stack/tile/iron/white/pavement
