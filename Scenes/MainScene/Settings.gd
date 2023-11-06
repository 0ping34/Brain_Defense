extends Control

#Pornirea si oprirea sunetului cand  se apeasa Return in Settings
func _on_Return_button_down():
	$Click.play()
	pass # Replace with function body.


func _on_Return_button_up():
	$Click.stop()
	pass # Replace with function body.
