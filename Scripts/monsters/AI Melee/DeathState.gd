extends Node

var AiController

func _ready()-> void:
	AiController= get_parent().get_parent()
	AiController.get_node("AnimationTree").get("parameters/playback").travel("Death")
	AiController.dying = true
	
	
func _physics_process(delta:float)-> void:
	if AiController:
		AiController.velocity.x=0
		AiController.velocity.z=0
