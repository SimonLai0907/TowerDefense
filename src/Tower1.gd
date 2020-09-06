extends Tower


var NextCannon = "Left"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func shoot():
	var pos
	if NextCannon == "Left":
		pos = $Cannon/Left.global_position
		NextCannon = "Right"
	else:
		pos = $Cannon/Right.global_position
		NextCannon = "Left"
	var projectile = preload("res://src/Projectile.tscn").instance()
	projectile.setup(self, pos, $Cannon.rotation, Target[0], Grade)
	get_parent().add_child(projectile)
	CoolTime = 0.0
	Ammo -= 1


func _on_mouse_entered():
	display_range(true)


func _on_mouse_exited():
	display_range(false)


func _on_Enemy_entered(area):
	add_target(area)


func _on_Enemy_exited(area):
	erase_target(area)


func _on_projectile_exited(body):
	if body.FromTower == self:
		body.destroy(0)
