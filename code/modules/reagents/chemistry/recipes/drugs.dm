/datum/chemical_reaction/space_drugs
	name = "Space Drugs"
	id = "space_drugs"
	results = list("space_drugs" = 3)
	required_reagents = list("mercury" = 1, "sugar" = 1, "lithium" = 1)

/datum/chemical_reaction/crank
	name = "Crank"
	id = "crank"
	results = list("crank" = 5)
	required_reagents = list("diphenhydramine" = 1, "ammonia" = 1, "lithium" = 1, "sacid" = 1, "welding_fuel" = 1)
	mix_message = "The mixture violently reacts, leaving behind a few crystalline shards."
	required_temp = 390


/datum/chemical_reaction/krokodil
	name = "Krokodil"
	id = "krokodil"
	results = list("krokodil" = 6)
	required_reagents = list("diphenhydramine" = 1, "morphine" = 1, "cleaner" = 1, "potassium" = 1, "phosphorus" = 1, "welding_fuel" = 1)
	mix_message = "The mixture dries into a pale blue powder."
	required_temp = 380

/datum/chemical_reaction/bath_salts
	name = "bath_salts"
	id = "bath_salts"
	results = list("bath_salts" = 7)
	required_reagents = list("bad_food" = 1, "saltpetre" = 1, "nutriment" = 1, "cleaner" = 1, "enzyme" = 1, "tea" = 1, "mercury" = 1)
	required_temp = 374

/datum/chemical_reaction/aranesp
	name = "aranesp"
	id = "aranesp"
	results = list("aranesp" = 3)
	required_reagents = list("epinephrine" = 1, "atropine" = 1, "morphine" = 1)
	
/datum/chemical_reaction/jet
	name = "Jet"
	id = "jet"
	results = list("jet" = 1)
	required_reagents = list("milk" = 1, "ammonia" = 1)
	mix_message = "The mixture bubbles, fumes wafting into the air."
	required_temp = 374
	
/datum/chemical_reaction/turbo
	name = "Turbo"
	id = "turbo"
	results = list("turbo" = 1)
	required_reagents = list("jet" = 1, "hydrogen" = 2, "welding_fuel" = 3)
	required_temp = 374
	
/datum/chemical_reaction/psycho
	name = "Psycho Fluid"
	id = "psycho"
	results = list("psycho" = 1)
	required_reagents = list("sacid" = 1, "silicon" = 1, "stimpak" = 1)
	mix_message = "The fluid froths and foams, turning a blood-red color."
