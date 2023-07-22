extends Camera2D

var PontoCardeal = 0
var xBase = 0 # Aperta pra frente altera esse valor
var yBase = 0

# Norte = 0 Leste = 1 Sul = 2 oeste = 3 -> Move sentido leste Horário,oeste antihorário, para trás

# camera.xBase, camera.yBase == (0,0)

func InputMovement():
	
	# Adicionar verificações para camera não sair dos tiles maps
	
	if Input.is_action_just_pressed("Frente"): 
		
		
		# Se o ponto cardeal for zero -> camera.yBase -= 384
		# Se o ponto cardeal for um -> camera.xBase += 384 * 4
		# Se o ponto cardeal for dois -> camera.yBase += 384
		# Se o ponto cardeal for três -> camera.xBase -= 384 * 4
		
		if PontoCardeal == 0:
			yBase -= 384
		if PontoCardeal == 1:
			xBase += 384*4
		if PontoCardeal == 2:
			yBase += 384
		if PontoCardeal == 3:
			xBase -= 384*4
		
		$".".position.y = yBase
		print("Frente ",PontoCardeal)
		
	if Input.is_action_just_pressed("Atras"):
		PontoCardeal+=2
		print("Atras")
	if Input.is_action_just_pressed("Direita"):
		PontoCardeal+=1
		print("Direita")

	if Input.is_action_just_pressed("Esquerda"):
		PontoCardeal+=3
		print("Esquerda")
	
	PontoCardeal %= 4
	
	$".".position.x = 384 * PontoCardeal + xBase
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	InputMovement()
