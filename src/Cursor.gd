extends Area2D


export var Normal = Color(1, 1, 1, 0.7)
export var Red = Color(1.2, 0.5, 0.5, 0.7)
var Type = 1
var Enabled = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var MousePos = get_viewport().get_mouse_position()
	position = snap_to_grid(MousePos)
	
	
func snap_to_grid(pos):
	pos.x = int(pos.x) / 64 * 64 + 32
	pos.y = int(pos.y) / 64 * 64 + 32
	return pos


func change_type(type):
	Type = type
	$AnimatedSprite.play("Type%d" % type)


func enable(On):
	if On:
		Enabled = true
		$Range.visible = true
		$AnimatedSprite.set_modulate(Normal)
	else:
		Enabled = false
		$Range.visible = false
		$AnimatedSprite.set_modulate(Red)


func _on_Tower_entered(area):
	visible = false


func _on_Tower_exited(area):
	visible = true
