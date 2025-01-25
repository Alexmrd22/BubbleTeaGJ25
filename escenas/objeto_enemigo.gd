extends RigidBody2D

# No necesitas ningún código para que funcione la gravedad básica.
# El motor ya la maneja automáticamente.

func _ready() -> void:
	# Configura la escala de la gravedad desde el código (opcional)
	self.gravity_scale = gravity_scale
