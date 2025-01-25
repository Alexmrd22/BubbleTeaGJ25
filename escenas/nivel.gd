extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Controlador.ruta_etiqueta_nivel = $CanvasLayer/Label
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mata_objetos_body_entered(body: Node2D) -> void:
	if body.is_in_group("burbuja"): 
		body.queue_free()
		
	elif body.is_in_group("malicies"): 
		body.queue_free()
	pass # Replace with function body.
