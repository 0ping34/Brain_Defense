extends Control

#pornirea si oprirea sunetului cand se apeasa pe Return in Credits

func _on_Return_button_down():
	$Click.play()
	pass # Replace with function body.


func _on_Return_button_up():
	$Click.stop()
	pass # Replace with function body.
