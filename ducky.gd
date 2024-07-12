extends Node2D

func play_duck_idle_animation():
	$AnimatedSprite.play("idle")
	
	
func play_duck_idle_left_animation():
	$AnimatedSprite.play("idle_left")


func play_duck_walk_animation():
	$AnimatedSprite.play("walk")

func play_duck_walk_left_animation():
	$AnimatedSprite.play("walk_left")
