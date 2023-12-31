extends PathFollow2D

#Programarea inamicului
signal base_damage(damage)

var speed = 5
var hp=200
var base_damage = 21

onready var health_bar = get_node("HealthBar")
onready var impact_area = get_node("Impact")
var projectile_impact = preload("res://SupportScenes/BrainT1 Impact.tscn")
	
func _ready():
	health_bar.max_value = hp
	health_bar.value = hp
	health_bar.set_as_toplevel(true)
	

func _physics_process(delta):
	if unit_offset == 1.0:
		emit_signal("base_damage", base_damage)
		queue_free()
	move(delta)
	
func move(delta):
	set_offset(get_offset() + speed + delta)
	health_bar.set_position(position - Vector2(30, 30))

func on_hit(damage):
	impact()
	hp -=damage
	health_bar.value = hp
	if hp<=0:
		on_destroy()
		$Death.play()

func impact():
	randomize()
	var x_pos = randi() % 35
	randomize()
	var y_pos = randi() % 35
	var impact_location = Vector2(x_pos, y_pos)
	var new_impact = projectile_impact.instance()
	new_impact.position = impact_location
	impact_area.add_child(new_impact)

func on_destroy():
	get_node("KinematicBody2D").queue_free()
	yield(get_tree().create_timer(0.2), "timeout")
	self.queue_free()
