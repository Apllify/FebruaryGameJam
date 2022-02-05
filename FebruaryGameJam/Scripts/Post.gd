extends Control


var is_good_think = false




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




#when the post is upvoted
func _on_upvoted():
	print("upvote !") 
	
#when the post is downvoted
func _on_downvoted():
	print("downvote !")

#when the post is removed
func _on_removed():
	print("removed!")
	queue_free()
