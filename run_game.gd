extends Node2D

func _ready():
	randomize()


func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	$Duck_player/Path2D/PathFollow2D.progress_ratio = randf()
	new_mob.global_position = $Duck_player/Path2D/PathFollow2D.global_position
	add_child(new_mob)


func spawn_tree():
	var new_tree = preload("res://tree_pine.tscn").instantiate()
	$Duck_player/Path2D/PathFollow2D.progress_ratio = randf()
	new_tree.global_position = $Duck_player/Path2D/PathFollow2D.global_position
	add_child(new_tree)


func _on_timer_timeout():
	spawn_mob()
	spawn_mob()
	#spawn_tree()


#func _on_timer_2_timeout():
	#var random_color = Color(randf(), randf(), randf())
	#$CanvasLayer/ColorRect.set_color(random_color)

func _on_replay_pressed():
	get_tree().change_scene_to_file("res://run_game.tscn")

func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")



func _on_duck_player_health_depleted():
	$GameOver.visible = true
	$Duck_player.visible = false
	$Duck_player/Ducky/Gun.queue_free()
	$Duck_player/Ducky/Gun2.queue_free()
	$Duck_player/Ducky/Gun3.queue_free()
	$Duck_player/Ducky/Gun4.queue_free()
