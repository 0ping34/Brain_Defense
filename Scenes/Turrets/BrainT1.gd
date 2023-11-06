extends "res://Scenes/Turrets/Brainst.gd"#mostenire

#pornirea si oprirea sunetului de foc cand un inamic iese din raza sau este distrus
func _on_Range_body_entered(body):
	enemy_array.append(body.get_parent())
	print(enemy_array)
	$Shoot.play()

func _on_Range_body_exited(body):
	$Shoot.stop()
	enemy_array.erase(body.get_parent())

