/*
			< ATTENTION >
	If you need to add more map_adjustment, check 'map_adjustment_include.dm'
	These 'map_adjustment.dm' files shouldn't be included in 'dme'
*/

/datum/map_adjustment/hispaniard
	map_file_name = "hispaniard.dmm"
	// Disabled for Hispaniard.
	blacklist = list(
		/datum/job/shophand, //Unneeded honestly.
	)
	// Limited positions to ensure core roles are filled.
	slot_adjust = list(
		/datum/job/feldsher = 1,
		/datum/job/cook = 1,
		/datum/job/servant = 2,
		/datum/job/carpenter = 3, //Towner roles don't need nearly as many, here.
		/datum/job/mason = 2,
		/datum/job/hunter = 3,
		/datum/job/bard = 3,
		/datum/job/miner = 4,
		/datum/job/fisher = 4, //Thematically fitting for them to be more common than most.
		/datum/job/farmer = 4, //Not like this would ever be filled ANYWAYS.
		/datum/job/vagrant = 6, //Beggars and orphans don't need to be nearly so populated.
		/datum/job/orphan = 8,
		/datum/job/men_at_arms = 3, //Combat roles overall tuned town a bit.
		/datum/job/guardsman = 6,
		/datum/job/adventurer = 8, //Not sure on this one but I generally want to cut down on the non-town roles.
		/datum/job/pilgrim = 15,
		/datum/job/clinicapprentice = 2,
		/datum/job/mercenary = 4,
	)
