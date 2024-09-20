extends CollisionObject3D
class_name Interactable

signal interacted(body, special_data)

@export var enabled = true
@export var is_holdable = false
@export var prompt_action_name = "Pick Up"
@export var prompt_action = "interact"
@export var prompt_object = "object"
func get_prompt():
	if not enabled:
		return ""
	
	var key_name := ""
	for action in InputMap.action_get_events(prompt_action):
		if action is InputEventKey:
			key_name = action.as_text_physical_keycode()
			break
		elif action is InputEventMouseButton:
			key_name = action.as_text()
	return prompt_object + "\n" + prompt_action_name + " [" + key_name + "]"


func interact(body, special_data ={}):
	if not enabled:
		return
	interacted.emit(body, special_data)
	return body
