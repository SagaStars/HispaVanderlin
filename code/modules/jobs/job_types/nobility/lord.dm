GLOBAL_VAR(lordsurname)
GLOBAL_LIST_EMPTY(lord_titles)

/datum/attribute_holder/sheet/job/lord
	raw_attribute_list = list(
		STAT_STRENGTH = -2,
		STAT_INTELLIGENCE = 8,
		STAT_CONSTITUTION = -4,
		STAT_SPEED = -2,
		/datum/attribute/skill/misc/reading = 60,
		/datum/attribute/skill/misc/riding = 20,
		/datum/attribute/skill/magic/arcane = 60,
		/datum/attribute/skill/combat/wrestling = 20,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/misc/athletics = 20,
		/datum/attribute/skill/combat/polearms = 20,
		/datum/attribute/skill/craft/alchemy = 60,
		/datum/attribute/skill/labor/mathematics = 60,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/climbing = 30,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/labor/mathematics = 60,
		/datum/attribute/skill/misc/stealing = 30,
		/datum/attribute/skill/misc/lockpicking = 30,
		/datum/attribute/skill/misc/sewing = 30,
		/datum/attribute/skill/misc/medicine = 60,
		/datum/attribute/skill/labor/fishing = 30,
		/datum/attribute/skill/labor/butchering = 30,
		/datum/attribute/skill/craft/cooking = 30,
		/datum/attribute/skill/craft/tanning = 30,
		/datum/attribute/skill/craft/crafting = 30,
		/datum/attribute/skill/craft/engineering = 30,
		/datum/attribute/skill/craft/carpentry = 30,
		/datum/attribute/skill/craft/masonry = 30,
		/datum/attribute/skill/craft/traps = 30,
		/datum/attribute/skill/craft/weaponsmithing = 30,
		/datum/attribute/skill/craft/armorsmithing = 30,
	)

/datum/job/lord
	title = "Master Director"
	var/ruler_title = "Master Director"
	tutorial = "Elevated to your throne through a web of intrigue, political maneuvering, and divine sanction, you are the \
	unquestioned authority of these lands. The Church has bestowed upon you the legitimacy of the gods themselves, and now \
	you sit at the center of every plot, and every whisper of ambition. Every man, woman, and child may envy your power and \
	would replace you in the blink of an eye. But remember, its not envy that keeps you in place, it is your will. Show them \
	the error of their ways."
	department_flag = NOBLEMEN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_LORD
	faction = FACTION_TOWN
	total_positions = 0
	spawn_positions = 1
	spells = list(
		/datum/action/cooldown/spell/undirected/list_target/grant_title,
		/datum/action/cooldown/spell/undirected/list_target/grant_nobility,
	)
	allowed_races = RACES_PLAYER_ROYALTY
	outfit = /datum/outfit/lord
	bypass_lastclass = TRUE
	give_bank_account = 500
	selection_color = "#7851A9"
	cmode_music = 'sound/music/cmode/nobility/CombatDungeoneer.ogg'
	can_have_apprentices = FALSE
	job_bitflag = BITFLAG_ROYALTY
	exp_type = list(EXP_TYPE_NOBLE, EXP_TYPE_LIVING, EXP_TYPE_LEADERSHIP)
	exp_types_granted = list(EXP_TYPE_NOBLE, EXP_TYPE_LEADERSHIP)
	exp_requirements = list(
		EXP_TYPE_LIVING = 1200,
		EXP_TYPE_NOBLE = 900,
		EXP_TYPE_LEADERSHIP = 300
	)

	spell_points = 30
	attunements_max = 6
	attunements_min = 4
	allowed_ages = list(AGE_OLD)
	attribute_sheet = /datum/attribute_holder/sheet/job/lord

	//These change on map load
	honorary = "Master Director"
	honorary_f = "Master Director"

	mind_traits = list(
		TRAIT_KNOW_KEEP_DOORS
	)
	traits = list(
		TRAIT_SEEPRICES,
		TRAIT_NOBLE_BLOOD,
		TRAIT_NOBLE_POWER,
		TRAIT_NOSEGRAB,
		TRAIT_HEAVYARMOR,
		TRAIT_MEDIUMARMOR,
	)

	spells = list(
		/datum/action/cooldown/spell/aoe/knock,
		/datum/action/cooldown/spell/undirected/jaunt/ethereal_jaunt,
		/datum/action/cooldown/spell/undirected/touch/prestidigitation,
	)

	voicepack_m = /datum/voicepack/male/evil

/datum/job/lord/New()
	. = ..()
	if(SSmapping.config?.monarch_title)
		honorary = SSmapping.config.monarch_title
		honorary_f = SSmapping.config.monarch_title //in case we dont have a female title and they share
	if(SSmapping.config?.monarch_title_f)
		honorary_f = SSmapping.config.monarch_title_f

/datum/job/lord/get_informed_title(mob/mob, ignore_pronouns, change_title = FALSE, new_title)
	if(change_title)
		ruler_title = new_title
		return "[ruler_title]"
	else
		return "[ruler_title]"

/datum/job/lord/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	SSticker.rulermob = spawned

	addtimer(CALLBACK(spawned, TYPE_PROC_REF(/mob/living/carbon/human, lord_color_choice)), 7 SECONDS)

	if(spawned.pronouns != SHE_HER)
		ruler_title = "[SSmapping.config.monarch_title]"
	else
		ruler_title = "[SSmapping.config.monarch_title_f]"

	if(spawned.gender == MALE)
		SSfamilytree.AddRoyal(spawned, FAMILY_FATHER)
	else
		SSfamilytree.AddRoyal(spawned, FAMILY_MOTHER)

	if(istype(spawned.patron, /datum/patron/inhumen/zizo))
		spawned.grant_language(/datum/language/undead)

	spawned.virginity = TRUE

	to_chat(world, "<b>[span_notice(span_big("Ha llegado [spawned.real_name], Director de Howarts y Gran Maestre Arcano. La mejor Casa sera la cual se gradue en esta semana!"))]</b>")
	to_chat(world, "<br>")

	if(spawned.dna?.species?.id == SPEC_ID_HUMEN && spawned.gender == MALE)
		spawned.dna.species.soundpack_m = new /datum/voicepack/male/evil()

/datum/outfit/lord
	name = "Monarch"
	head = /obj/item/clothing/head/crown/serpcrown
	backr = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/plaquegold
	beltl = /obj/item/weapon/knife/dagger/steel/royal
	beltr = /obj/item/weapon/sword/rapier
	scabbards = list(/obj/item/weapon/scabbard/knife/royal, /obj/item/weapon/scabbard/sword/royal)
	ring = /obj/item/clothing/ring/active/nomag
	l_hand = /obj/item/weapon/lordscepter

/datum/outfit/lord/map_override(mob/living/carbon/human/H)
	if(SSmapping.config.map_name != "Voyage")
		return
	head = /obj/item/clothing/head/helmet/leather/tricorn
	cloak = /obj/item/clothing/cloak/half
	l_hand = null
	armor = /obj/item/clothing/armor/leather/jacket/silk_coat
	shirt = /obj/item/clothing/shirt/undershirt/puritan
	wrists = null
	shoes = /obj/item/clothing/shoes/boots

/datum/outfit/lord/pre_equip(mob/living/carbon/human/equipped_human, visuals_only)
	. = ..()

	if(equipped_human.gender == MALE)
		pants = /obj/item/clothing/pants/trou/formal
		shirt = /obj/item/clothing/shirt/undershirt/fancy
		armor = /obj/item/clothing/armor/gambeson/arming
		shoes = /obj/item/clothing/shoes/nobleboot
		cloak = /obj/item/clothing/cloak/lordcloak
	else
		pants = /obj/item/clothing/pants/tights/colored/random
		armor = /obj/item/clothing/shirt/dress/royal
		shoes = /obj/item/clothing/shoes/nobleboot
		cloak = /obj/item/clothing/cloak/lordcloak/ladycloak
		wrists = /obj/item/clothing/wrists/royalsleeves

	if(equipped_human.wear_mask)
		if(istype(equipped_human.wear_mask, /obj/item/clothing/face/eyepatch))
			qdel(equipped_human.wear_mask)
			mask = /obj/item/clothing/face/lordmask
		else if(istype(equipped_human.wear_mask, /obj/item/clothing/face/eyepatch/left))
			qdel(equipped_human.wear_mask)
			mask = /obj/item/clothing/face/lordmask/l

/datum/job/exlord //just used to change the lords title
	title = "Ex-Monarch"
	department_flag = NOBLEMEN
	faction = FACTION_TOWN
	total_positions = 0
	spawn_positions = 0
	display_order = JDO_LORD
	honorary = "Former Lord"
	honorary_f = "Former Lady"

/datum/job/exlord/New()
	. = ..()
	if(SSmapping.config?.monarch_title)
		honorary = "Former [SSmapping.config.monarch_title]"
		honorary_f = "Former [SSmapping.config.monarch_title]" //in case we dont have a female title and they share
	if(SSmapping.config?.monarch_title_f)
		honorary_f = "Former [SSmapping.config.monarch_title_f]"

