extends Node2D


var double_tab_leniency = 0.2
var double_tab_timer

var is_second_tab = false

# Called when the node enters the scene tree for the first time.
func _ready():
	double_tab_timer = Timer.new()
	double_tab_timer.set_wait_time(double_tab_leniency)
	double_tab_timer.connect("timeout", self, "cooldown_expired")
	add_child(double_tab_timer)



func _process(delta):
	if Input.is_action_just_pressed("switch_tab"):
		if is_second_tab:
			switch_scene()
		else:
			double_tab_timer.start()
			is_second_tab = true


func cooldown_expired() :
	is_second_tab = false
	
func switch_scene():
	var current_scene_name = get_tree().get_current_scene().get_name()
	
	print(current_scene_name)
	
	if current_scene_name == "BanningSimulator":
		get_tree().change_scene("res://Scenes/JobApplications.tscn")
	elif current_scene_name == "JobApplications":
		get_tree().change_scene("res://Scenes/BanningSimulator.tscn")
