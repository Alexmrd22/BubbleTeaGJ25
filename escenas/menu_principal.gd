extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_jugar_pressed() -> void:
	Controlador.goto_scene("res://escenas/nivel.tscn")


func _on_salir_pressed() -> void:
	pass # Replace with function body.


func _on_controles_pressed() -> void:
	pass # Replace with function body.
