extends Node2D

var post_class

var bad_thinks = [
	"I love kissing the ass of an authoritarian government that has killed 60-80 million of its own citizens",
	"I just looked at a few posts here and the community info, and forgive me but is this satire?",
	"Freedom to all! Glad you exercise and support your freedom fellow members",
	"This government is a shitty, totalitarian, Communist hive of inhuman scum.",
	"Fuck the Admins and Fuck the Government",
	"Nobody: , Mods: You have been permanently suspended for a violation of the Content Policy. ",
	"Don’t forget to mention the millions of people they have locked up in concentration camps in..."
	
]

var good_think = [
	"[Guide] How to shut down any anti-government talking points",
	"How to convince people that revolutionaries and anarchists are usseless fucking parasites?",
	"My parents just spent an hour trying to convince me that we have a dictatorship, what do ? ",
	"I hAtE goVerNmenT inTErVention..."
	
]


# Called when the node enters the scene tree for the first time.
func _ready():
	post_class = load("res://Prefabs/Post.tscn")


func generate_front_page():
	
	for i in range(20):
		#create post instance
		var post_instance = post_class.instance()
		
		#get post text_field :
		
