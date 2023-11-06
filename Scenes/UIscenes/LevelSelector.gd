extends Control

#Pornirea si oprirea sunetului cand se apeasa un buton de nivel

func _on_Level_1_button_down():
	$Click.play()
	pass # Replace with function body.


func _on_Level_1_button_up():
	$Click.stop()
	pass # Replace with function body.


func _on_Level_2_button_down():
	$Click.play()
	pass # Replace with function body.


func _on_Level_2_button_up():
	$Click.stop()
	pass # Replace with function body.
