/// Set or update the global movespeed config on a mob
/mob/proc/update_config_movespeed()
	add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/mob_config_speedmod, multiplicative_slowdown = get_config_multiplicative_speed())