extends RigidBody2D

func _ready() -> void:
	self.gravity_scale = gravity_scale
	$Sprite2D/AnimationPlayer.play("giro")
