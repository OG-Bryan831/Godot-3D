extends Node # allows us to create a new node/object as a node as a base 

var AiController

func _ready()-> void:
	AiController= get_parent().get_parent()
	if AiController.Awakening:
		await AiController.get_node("AnimationTree").animation_finished
	AiController.get_node("AnimationTree").get("parameters/playback").travel("Idle")
	
	
func _physics_process(delta:float)-> void:
	if AiController:
		AiController.velocity.x=0
		AiController.velocity.z=0
	
