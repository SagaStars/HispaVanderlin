/*
			< ATTENTION >
	If you need to add more map_adjustment, check 'map_adjustment_include.dm'
	These 'map_adjustment.dm' files shouldn't be included in 'dme'
*/

/datum/map_adjustment/howarts
	map_file_name = "howarts.dmm"

	blacklist = list(
		/datum/job/orphan,
		/datum/job/churchling,
		/datum/job/innkeep_son,
		/datum/job/soilchild,

		/datum/job/bard,
		/datum/job/farmer,
		/datum/job/prisoner,
		/datum/job/miner,
		/datum/job/jester,
		/datum/job/hunter,
		/datum/job/fisher,
		/datum/job/cook,
		/datum/job/cheesemaker,
		/datum/job/vagrant,

		/datum/job/artificer,
		/datum/job/carpenter,
		/datum/job/tomb_warden,
		/datum/job/matron,
		/datum/job/butler,
		/datum/job/undertaker,
		/datum/job/apothecary,
		/datum/job/town_elder,
		/datum/job/innkeep,
		/datum/job/blacksmith,
		/datum/job/tailor,
		/datum/job/feldsher,

		/datum/job/captain,
		/datum/job/consort,
		/datum/job/courtphys,
		/datum/job/hand,
		/datum/job/prince,
		/datum/job/bapprentice,
		/datum/job/bandit,
		/datum/job/minor_noble,
		/datum/job/adventurer/courtagent,
		/datum/job/archivist,
		/datum/job/orthodoxist,
		/datum/job/steward,
		/datum/job/magician,

		/datum/job/bapprentice,
		/datum/job/mageapprentice,
		/datum/job/squire,
		/datum/job/tapster,
		/datum/job/clinicapprentice,
		/datum/job/advclass/pilgrim/mason,

		/datum/job/gmtemplar,
		/datum/job/monk,
		/datum/job/priest,
		/datum/job/templar,

		/datum/job/lieutenant,
		/datum/job/dungeoneer,
		/datum/job/men_at_arms,
		/datum/job/forestwarden,
		/datum/job/forestguard,
		/datum/job/gatemaster,
		/datum/job/royalknight,
		/datum/job/guardsman,

		/datum/job/inquisitor,
		/datum/job/absolver,
		/datum/job/adept,

		/datum/job/merchant,
		/datum/job/grabber,
		/datum/job/shophand,

		/datum/job/adventurer,
		/datum/job/pilgrim,
		/datum/job/mercenary,
		/datum/job/advclass,
		/datum/job/advclass/combat,
		/datum/job/advclass/pilgrim/mason,
	)
