extends Node

var AiController
var run: bool

func _ready()-> void:
	AiController= get_parent().get_parent()
	if AiController.Attacking:
		await AiController.get_node("AnimationTree").animation_finished
		AiController.Attacking=false
	else:
		run = false
		AiController.get_node("AnimationTree").get("parameters/playback").travel("Awaken")
		AiController.Awakening=true
		await AiController.get_node("AnimationTree").animation_finished
	run=true
	AiController.Awakening=false
	AiController.get_node("AnimationTree").get("parameters/playback").travel("Run")
	
	
func _physics_process(delta:float)-> void:
	if AiController and run:
		AiController.velocity.x= AiController.direction.x * AiController.speed* 10
		AiController.velocity.z= AiController.direction.z * AiController.speed* 10
		AiController.look_at(AiController.global_transform.origin+ AiController.direction, Vector3(0,1,0))
