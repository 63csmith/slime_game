extends Node2D




func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func spawn_tree():
	var new_tree = preload("res://tree_pine.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_tree.global_position = %PathFollow2D.global_position
	add_child(new_tree)


func _on_timer_timeout():
	spawn_mob()
	#spawn_tree()

func _on_player_health_depleted():
	$GameOver.visible = true
	$Player.visible = false
	$Player/HappyBoo/Gun.queue_free()
	#get_tree().paused = true
	

func _on_timer_2_timeout():
	spawn_tree()

func _on_replay_pressed():
	get_tree().change_scene_to_file("res://run_game.tscn")

func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")

