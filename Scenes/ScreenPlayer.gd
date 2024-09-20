extends VideoStreamPlayer


func _on_mm_projector_interacted(_body, special_data):
	if not is_playing():
		if(special_data.has("happy")):
			var film_path: String = special_data["happy"].film_path_name
			var v_stream: VideoStream = load("res://Movies/"+film_path+".ogv")
			set_stream(v_stream)
			play()

	elif is_playing():
		stop()
		pass
		
