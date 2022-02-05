extends Node2D

var post_class
var rng 

var scrollbox_reference

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
