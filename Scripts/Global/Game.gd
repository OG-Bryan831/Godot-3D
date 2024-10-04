extends Node

var items:Dictionary= {
	"Long Sword": preload("res://Scenes/player/GUI/inventory/long_sword.tres"),
	"Iron Sword": preload("res://Scenes/player/GUI/inventory/iron_sword.tres"),
	"Small Potion": preload("res://Scenes/player/GUI/inventory/small_potion.tres"),
	"Big Sword": preload("res://Scenes/player/GUI/inventory/my_sword.tres"),
	"Iron Body": preload("res://Scenes/player/GUI/inventory/iron_body.tres"),
	"Big Potion": preload("res://Scenes/player/GUI/inventory/big_potion.tres")
}

var gold: int = 100
var player_health: int = 5
var player_health_max: int = 5
var right_hand_equipped: ItemData
var body_equipped: ItemData

var player_damage: int = 0
var player_defense:int = 0

var current_exp: int =0
var exp_to_next_level:int =100
var player_level: int =1

var shopping:bool = false

func _ready() -> void:
	self.process_mode=Node.PROCESS_MODE_ALWAYS
	
func _process(delta: float) -> void:
	player_damage=right_hand_equipped.item_damage + body_equipped.item_damage
	player_defense=right_hand_equipped.item_defense + body_equipped.item_defense


func heal_player(health:int)-> void:
	pass
