extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -400.0
var anim_actual = "idle" # animacion actual: parado


func _process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		cambiar_animacion("andando")
		if velocity.x < 0:
			$Sprite2D.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if global_position.x < -650:
		global_position.x = 1520
	elif global_position.x > 1520:
		global_position.x = -650
		
func cambiar_animacion(nombre_anim):
	if nombre_anim != anim_actual:
		$Sprite2D/AnimationPlayer.play(nombre_anim)
		anim_actual = nombre_anim
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("burbuja"):
		body.queue_free()
		Controlador.aumentarPuntoSoso()
	if body.is_in_group("malicies"):
		body.queue_free()
		Controlador.disminuirPuntoSoso()
	pass # Replace with function body.
