extends CharacterBody3D


var speed: float= 1.0
@onready var item_object_scene= preload("res://Scenes/item_object.tscn")
@onready var state_controller = get_node("StateMachine")
@export var player: CharacterBody3D # represent our player as a variable
var direction: Vector3 # which direction is the player
var Awakening: bool= false
var Attacking: bool =false
var health:int = 4
var damage: int = 2
var dying: bool = false
var just_hit: bool = false

func _ready() -> void:
	state_controller.change_state("Idle")
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_instance_valid(player):
		direction= (player.global_transform.origin - self.global_transform.origin).normalized()
	move_and_slide()
	


func _on_chase_player_detection_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and !dying:
		state_controller.change_state("Run")


func _on_chase_player_detection_body_exited(body: Node3D) -> void:
	if body.is_in_group("player") and !dying:
		state_controller.change_state("Idle")


func _on_attack_player_detection_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and !dying:
		state_controller.change_state("Attack")


func _on_attack_player_detection_body_exited(body: Node3D) -> void:
	if body.is_in_group("player") and !dying:
		state_controller.change_state("Run")


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if "Awaken" in anim_name:
		Awakening=false
	elif "Attack" in anim_name:
		if(player in get_node("attack_player_detection").get_overlapping_bodies()) and !dying:
			state_controller.change_state("Attack")
	elif "Death" in anim_name:
		death()
		
func death():
	var rng=randi_range(2,4)
	for i in rng:
		var item_object_temp=item_object_scene.instantiate()
		item_object_temp.global_position=self.global_position
		get_node("../../Items").add_child(item_object_temp)
	Game.gain_exp(100)
	self.queue_free()
	
func hit(dmg: int):
	if !just_hit:
		just_hit=true
		get_node("just_hit").start()
		health-= dmg
		if health<0:
			state_controller.change_state("Death")
		#knockback
		var tween = create_tween()
		tween.tween_property(self,"global_position",global_position- (direction/1.5), 0.2)
		


func _on_just_hit_timeout() -> void:
	just_hit = false



func _on_damage_toplayer_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		body.damage_toplayer(damage)
