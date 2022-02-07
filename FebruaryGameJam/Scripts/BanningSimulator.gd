extends Node2D

var post_class
var rng 

var scrollbox_reference
var streak_indicator_reference

var bar_reference
var float_bar_value  
var bar_deplete_rate = 3.0
var current_streak = 0


var bad_thinks = [
	"I love kissing the ass of an authoritarian government that has killed 60-80 million of its own citizens",
	"I just looked at a few posts here and the community info, and forgive me but is this satire?",
	"Freedom to all! Glad you exercise and support your freedom fellow members",
	"This government is a shitty, totalitarian, Communist hive of inhuman scum.",
	"Fuck the Admins and Fuck the Government",
	"Nobody: , Mods: You have been permanently suspended for a violation of the Content Policy. ",
	"Don’t forget to mention the millions of people they have locked up in concentration camps in..."
	
]

var good_thinks = [
	"[Guide] How to shut down any anti-government talking points",
	"How to convince people that revolutionaries and anarchists are usseless fucking parasites?",
	"My parents just spent an hour trying to convince me that we have a dictatorship, what do ? ",
	"I hAtE goVerNmenT inTErVention..."
	
]

var random_adjectives = [
	"Ancient",
	"Busy",
	"Lazy",
	"Hollow",
	"Low",
	"New",
	"Safe",
	"Wild"
]

var random_animals = [
	"Ant",
	"Cow",
	"Dog",
	"Dolphin",
	"Fox",
	"Frog",
	"Impala",
	"Scorpion",
	"Bull"
]


# Called when the node enters the scene tree for the first time.
func _ready():
	post_class = load("res://Prefabs/Post.tscn")
	rng = RandomNumberGenerator.new()
	rng.randomize()
	
	scrollbox_reference = get_node("ScrollContainer").get_node("VBoxContainer")
	streak_indicator_reference = get_node("StreakIndicator")
	
	bar_reference = get_node("SocialCreditBar")
	float_bar_value = bar_reference.get_value()
	
	generate_front_page()
	

func generate_username():
	var adjective_index = rng.randi_range(0, len(random_adjectives) - 1)
	var animal_index = rng.randi_range(0, len(random_animals) - 1)
	var number = rng.randi_range(0, 999)
	
	return random_adjectives[adjective_index] + random_animals[animal_index] + str(number)
	


func generate_front_page():
	
	for i in range(20):
		#create post instance
		var post_instance = post_class.instance()
		
		#determin if good think or bad think
		var is_good_think = rng.randi_range(0, 1) == 1
		
		var random_post = ""
		
		if is_good_think : 
			var random_post_index = rng.randi_range(0, len(good_thinks) - 1)
			random_post = good_thinks[random_post_index]
		else:
			var random_post_index = rng.randi_range(0, len(bad_thinks) - 1)
			random_post = bad_thinks[random_post_index]
		
		var random_username = generate_username()
		
		post_instance.is_good_think = is_good_think
		post_instance.post_content = random_post
		post_instance.post_author = random_username
		
		scrollbox_reference.add_child(post_instance)
		
	var final_control = Control.new()
	scrollbox_reference.add_child(final_control)	

func _process(delta):
	#deplete the social credit gauge by the given rate
	float_bar_value -= bar_deplete_rate * delta
	bar_reference.set_value(float_bar_value)
	
func update_streak_indicator():
	var new_text = "Streak : " + str(current_streak)
	streak_indicator_reference.set_text(new_text)
	
func update_credit(action_conformity):
	#the action conformity argument determins how "good" an action is from the perspective of the government
	
	#update streak depending on whether this is a good action
	if action_conformity >= 0 :
		current_streak += 1
	else:
		current_streak = 0
		
	#cap streak bonus at 5 
	if current_streak > 5:
		current_streak = 5
		
	#update the sterak indicator
	update_streak_indicator()
		 
		
	float_bar_value += action_conformity + current_streak * 2
	bar_reference.set_value(float_bar_value)

