extends Node2D

#variabile globale
var type
var enemy_array=[]
var built = false
var enemy
var ready = true
var category

#functionalitati generale ale turetelor
func _ready():
	if built:
		self.get_node("Range/CollisionShape2D").get_shape().radius=0.5 * GameData.tower_data[type]["range"]

func _physics_process(_delta):
	if enemy_array.size() !=0 and built:
		select_enemy()
		if not get_node("AnimationPlayer").is_playing():
			turn()
		if ready:
			fire()
	else:
		enemy= null
	
func turn():
	
	get_node("Creier").look_at(enemy.position)

func select_enemy():
	var enemy_progress_array = []
	for i in enemy_array:
		enemy_progress_array.append(i.offset)
	var max_offset = enemy_progress_array.max()
	var enemy_index=enemy_progress_array.find(max_offset)
	enemy=enemy_array[enemy_index]

func fire():
	ready = false
	if category == "BrainT1":
		fire_gun1()
	elif category == "BrainT2":
		fire_gun2()
	elif category =="BrainT3":
		fire_gun3()
	enemy.on_hit(GameData.tower_data[type]["damage"])
	yield(get_tree().create_timer(GameData.tower_data[type]["rof"]), "timeout")
	ready = true
	
func fire_gun1():
	get_node("AnimationPlayer").play("fire")

func fire_gun2():
	get_node("AnimationPlayer").play("fire2")

func fire_gun3():
	get_node("AnimationPlayer2").play("fire3")
	
