extends Node2D

const burbuja = preload("res://escenas/burbuja.tscn")
const chorizo = preload("res://escenas/chorizoEnemigo.tscn")
const jalapenio = preload("res://escenas/jalapenio.tscn")
const pescao = preload("res://escenas/raspa_pescado.tscn")

var vidas = 3

var area_generacion = Rect2(Vector2(50, -10), Vector2(1870, -10))
@onready var timer = $Timer;

var v_numeros: Array = [1, 1, 1, 2 ,3, 4]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Controlador.ruta_etiqueta_nivel = $CanvasLayer/Label
	timer.wait_time = 1.0
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mata_objetos_body_entered(body: Node2D) -> void:
	if body.is_in_group("burbuja"): 
		body.queue_free()
		
	elif body.is_in_group("malicies"): 
		body.queue_free()
	pass # Replace with function body.
	
func generar_objetos_aleatorios(v_numeros: Array) -> void:
	var objeto = null
	var i = randi() % v_numeros.size()
	
	if (v_numeros[i] == 1):
		objeto = burbuja.instantiate()
	
	elif (v_numeros[i] == 2):
		objeto = chorizo.instantiate()
		
	elif (v_numeros[i] == 3):
		objeto = jalapenio.instantiate()
		
	else:
		objeto = pescao.instantiate()
	
	var posicion_aleatoria = Vector2(
	randf_range(area_generacion.position.x, area_generacion.end.x),
	randf_range(area_generacion.position.y, area_generacion.end.y)
	)
	
	objeto.position = posicion_aleatoria
	
	self.add_child(objeto)

func _on_timer_timeout() -> void:
	generar_objetos_aleatorios(v_numeros)
