extends AnimatedSprite

#Animatia de impact asupra inamicilor
func _ready():
	_set_playing(true)

func _on_AnimatedSprite_animation_finished():
	queue_free()
