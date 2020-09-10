extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var CursorMapPos = $Tilemap.world_to_map($Cursor.position)
	if $Tilemap.get_cellv(CursorMapPos) == 1:
		$Cursor.enable(true)
	else:
		$Cursor.enable(false)
	if Input.is_action_just_pressed("LeftClick") and $Cursor.Enabled:
		if $Cursor.Type == 1:
			var tower1 = preload("res://src/Tower1.tscn").instance()
			tower1.position = $Cursor.position
			add_child(tower1)
