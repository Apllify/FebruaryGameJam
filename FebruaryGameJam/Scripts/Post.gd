extends Control


var is_good_think = false
var post_content = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
var post_author = "username"




# Called when the node enters the scene tree for the first time.
func _ready():
	var post_content_field = get_node("PostContent")
	post_content_field.set_text(post_content)
	
	var post_author_field = get_node("PostAuthor")
	post_author_field.set_text("posted by u/" + post_author)




func _on_upvoted():
	print("upvote !") 
	
#when the post is downvoted
func _on_downvoted():
	print("downvote !")

#when the post is removed
func _on_removed():
	print("removed!")
	queue_free()
