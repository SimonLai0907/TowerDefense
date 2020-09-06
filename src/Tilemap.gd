extends TileMap


export var SpawnTime = 1.0


# Called when the node enters the scene tree for the first time.
func _ready():
	$SpawnTimer.start(SpawnTime)
	spawn_enemy()
	randomize()


func spawn_enemy():
	var enemy = preload("res://src/Soldier.tscn").instance()
	var path = get_tree().get_nodes_in_group("Path")
	path[randi() % len(path)].add_child(enemy)
	$SpawnTimer.start(rand_range(SpawnTime/2, SpawnTime/2*3))
