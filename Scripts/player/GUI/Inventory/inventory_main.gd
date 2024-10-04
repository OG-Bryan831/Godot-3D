extends Node

@export var inventory_size= 24
@onready var grid= get_node("grid")

func _ready() -> void:
	for i in range(inventory_size):
		var slot= InventorySlot.new()
		slot.init(ItemData.Type.MAIN, Vector2(32,32))
		grid.add_child(slot)
	add_item("Long Sword")
	add_item("Iron Body")
	add_item("Big Sword")
	add_item("Iron Sword")
	add_item("Big Potion")
	add_item("Big Potion")


#func add_item(item_name: String)-> void:
	#var item = InventoryItem.new()
	#item.init(Game.items[item_name])
	#if item.data.stackable:
		#for i in inventory_size: #items arent stacking
			#if grid.get_child(i).get_child_count() > 0: # item in slot
				#if grid.get_child(i).get_child(0).data == item.data:
					##update counter
					#grid.get_child(i).get_child(0).data.count += 1
					##update the label counter
					#grid.get_child(i).get_child(0).get_child(0).text = str(grid.get_child(i).get_child(0).data.count)
					#break
				#else:
					#grid.get_child(i).add_child(item)
					#break
				#
	#else:
		#for i in inventory_size:
			#if grid.get_child(i).get_child_count()==0:
				#grid.get_child(i).add_child(item)
				#break

func add_item(item_name: String) -> void:
	var item = InventoryItem.new()
	item.init(Game.items[item_name])
	if item.data.stackable:
		for i in range(inventory_size):
			if grid.get_child(i).get_child_count() > 0:
				if grid.get_child(i).get_child(0).data == item.data:
					# update the counter
					grid.get_child(i).get_child(0).data.count += 1
					# update the label counter
					grid.get_child(i).get_child(0).get_child(0).text = str(grid.get_child(i).get_child(0).data.count)
					break
			# if i cant find an item... (if i didnt have it yet)
				else:
					grid.get_child(i).add_child(item)
					break
	else:
		for i in inventory_size:
			if grid.get_child(i).get_child_count() == 0:
				grid.get_child(i).add_child(item)
				break
