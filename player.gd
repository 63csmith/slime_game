extends CharacterBody2D

signal health_depleted 

var health = 100.0
var can_move = true

func _physics_process(delta):
	if can_move:
		var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		velocity = direction * 600
		move_and_slide()
		
		if velocity.length() > 0.0:
			$HappyBoo.play_walk_animation()
		else:
			$HappyBoo.play_idle_animation()
		
		const DAMAGE_RATE = 5.0
		var overlapping_mobs = $HappyBoo/HurtBox.get_overlapping_bodies()
		if overlapping_mobs.size() > 0:
			health -= DAMAGE_RATE * overlapping_mobs.size() * delta
			$HappyBoo/ProgressBar.value = health
			if health <= 0.0:
				health_depleted.emit()
				can_move = false
	else:
		velocity = Vector2.ZERO  # Ensure the player doesn't move
		move_and_slide()  # Call this to apply the zero velocity



	#if can_move:
		#var direction = Input.get_vector("move_left","move_right","move_up","move_down")
		#velocity = direction * 600
		#move_and_slide()
		#
		#if velocity.length() > 0.0:
			#%HappyBoo.play_walk_animation()
		#else:
			#%HappyBoo.play_idle_animation()
		#
		#const DAMAGE_RATE = 5.0
		#var overlaping_mobs = %HurtBox.get_overlapping_bodies()
		#if overlaping_mobs.size() > 0:
			#health -= DAMAGE_RATE * overlaping_mobs.size() * delta
			#%ProgressBar.value = health
			#if health <= 0.0:
				#health_depleted.emit()
	#else:
		#velocity = Vector2.ZERO  # Ensure the player doesn't move
