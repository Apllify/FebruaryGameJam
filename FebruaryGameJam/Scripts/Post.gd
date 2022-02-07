extends Control


var is_good_think = false
var post_content = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
var post_author = "username"

var banning_handler




# Called when the node enters the scene tree for the first time.
func _ready():
	var post_content_field = get_node("PostContent")
	post_content_field.set_text(post_content)
	
	var post_author_field = get_node("PostAuthor")
	post_author_field.set_text("posted by u/" + post_author)
	
	#check if the post is in the right scene currently
	if get_owner() != get_tree().get_root():
		banning_handler = get_tree().get_root().get_node("BanningSimulator")




func _on_upvoted():
	if is_good_think:
		banning_handler.update_credit(4)
	else:
		banning_handler.update_credit(-2)
	disable_all_buttons()

	
#when the post is downvoted
func _on_downvoted():
	if is_good_think:
		banning_handler.update_credit(-2)
	else:
		banning_handler.update_credit(4)
	disable_all_buttons()


#when the post is removed
func _on_removed():
	if is_good_think:
		banning_handler.update_credit(-8)
	else:
		banning_handler.update_credit(8)
	
	disable_all_buttons()
	queue_free()
	
	
func disable_all_buttons():
	var upvote_button = get_node("Upvote")
	var block_button = get_node("Block")
	var delete_button = get_node("Delete")
	
	upvote_button.set_disabled(true)
	block_button.set_disabled(true)
	delete_button.set_disabled(true)
