extends RigidBody2D

func _ready() -> void:
	# Configura la escala de la gravedad desde el código (opcional)
	self.gravity_scale = gravity_scale
	$Sprite2D/AnimationPlayer.play("giro")

func cambiarAnimacionBurbuja():
	$Sprite2D/AnimationPlayer.play("explotar")
