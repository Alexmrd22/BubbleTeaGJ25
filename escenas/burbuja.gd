extends RigidBody2D

const TIEMPO_EXPLOSION = 0.7

func _ready() -> void:
	# Configura la escala de la gravedad desde el código (opcional)
	self.gravity_scale = gravity_scale
	$Sprite2D/AnimationPlayer.play("giro")

func cambiarAnimacionBurbuja(anim):
	$Sprite2D/AnimationPlayer.play(anim)
	
	# Si la animación es "explotar", iniciar un temporizador para eliminarse
	if anim == "explotar":
		var timer = Timer.new()
		timer.wait_time = TIEMPO_EXPLOSION  # Esperar el tiempo que dura la animación
		timer.one_shot = true
		timer.timeout.connect(_on_timer_explosion_timeout)
		add_child(timer)
		timer.start()

func _on_timer_explosion_timeout():
	# Eliminar la burbuja después de que la animación termine
	queue_free()
	print("Burbuja eliminada automáticamente.")
	
func _restablecer_rotacion_y_congelar():
	# Restablecer la rotación a 0 grados
	self.rotation = 0  # O usar self.rotation_degrees = 0
	# Congelar la rotación para evitar que siga girando
	self.freeze = true
	
