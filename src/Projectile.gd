extends RigidBody2D

class_name Projectile

export var Damage = 10.0
export var Speed = 700.0
signal destroy(Exp)
var FromTower
var Target


func setup(tower, pos, direction, target, grade):
	FromTower = tower
	position = pos
	linear_velocity = Vector2(cos(direction) * Speed, sin(direction) * Speed)
	rotation = direction
	Target = target
	if grade == 2:
		Damage *= 1.5
	connect("destroy", FromTower, "ammo_recover")


func destroy(Exp):
	emit_signal("destroy", Exp)
	queue_free()
