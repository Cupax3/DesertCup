/datum/player_details
	var/list/player_actions = list()
	var/list/logging = list(INDIVIDUAL_ATTACK_LOG, INDIVIDUAL_SAY_LOG, INDIVIDUAL_EMOTE_LOG, INDIVIDUAL_OOC_LOG, INDIVIDUAL_LOOC_LOG)
	var/list/post_login_callbacks = list()
	var/list/post_logout_callbacks = list()
	var/list/played_names = list() //List of names this key played under this round
	var/byond_version = "Unknown"
	var/datum/achievement_data/achievements

/datum/player_details/New(key)

/proc/log_played_names(ckey, ...)
	if(!ckey)
		return
	if(args.len < 2)
		return
	var/list/names = args.Copy(2)
	var/datum/player_details/P = GLOB.player_details[ckey]
	if(P)
		for(var/name in names)
			if(name)
				P.played_names |= name
