extends Interactable



func _on_interacted(_body, specialData):

	$ProjectionLight.visible = true
	if not $AudioStreamPlayer3D.is_playing():
		$AudioStreamPlayer3D.play()
	elif $AudioStreamPlayer3D.is_playing():
		$AudioStreamPlayer3D.stop()
