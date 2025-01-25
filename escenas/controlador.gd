extends Node

var puntuacion = 0
var ruta_etiqueta_nivel = null
var ruta_etiqueta_tiempo = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func aumentarPuntoSoso():
	puntuacion += 1
	ruta_etiqueta_nivel.text = "Bubbles: "+ str(puntuacion)
	pass
	
func disminuirPuntoSoso():
	puntuacion -= 1
	ruta_etiqueta_nivel.text = "Bubbles: "+ str(puntuacion)
	pass
	
func disminuirTiempoSoso(tiempo_restante):
	ruta_etiqueta_tiempo.text = "Tiempo: "+ str(int(tiempo_restante))
	pass
	
