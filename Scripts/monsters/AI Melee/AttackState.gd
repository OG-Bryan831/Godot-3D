extends Node

var AiController

func _ready()-> void:
	AiController= get_parent().get_parent()
	if AiController.Awakening:
		await AiController.get_node("AnimationTree").animation_finished
	AiController.Attacking = true
	AiController.get_node("AnimationTree").get("parameters/playback").travel("Attack")
	AiController.look_at(AiController.global_transform.origin+ AiController.direction, Vector3(0,1,0))
	
	
func _physics_process(delta:float)-> void:
	if AiController:
		AiController.velocity.x=0
		AiController.velocity.z=0
