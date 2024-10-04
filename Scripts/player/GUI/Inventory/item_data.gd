class_name ItemData
extends Resource # allows use to add GUI into a info packet

enum Type{WEAPON, HEAD, BODY, LEGS, FEET, MISC, MAIN}

@export var type: Type
@export var item_name: String
@export var item_damage: int
@export var item_health: int
@export var item_defense: int
@export var stackable: bool
@export var count: int
@export_multiline var description: String
@export var item_texture: Texture2D
