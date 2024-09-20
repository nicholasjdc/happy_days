extends RayCast3D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	$Prompt.text= ""
	if is_colliding():
		var collider = get_collider()

		if collider is Interactable:
			$Prompt.text = collider.get_prompt()
			if Input.is_action_just_pressed(collider.prompt_action):
				var data = {}

				if $"../Hand".get_child_count():
					data["happy"] = $"../Hand".get_node("16mmFilm")
				collider.interact(owner, data)
				if collider.is_holdable:
					collider.reparent($"../Hand")
					collider.position = $"../Hand".position



