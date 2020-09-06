extends PathFollow2D

class_name Enemy

export var Speed = 50.0
export var MaxOffset = 16.0
export var HP = 15.0
export var Exp = 10
export var Money = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	v_offset = rand_range(-MaxOffset, MaxOffset)


func _physics_process(delta):
	offset += Speed * delta
	if unit_offset >= 1:
		queue_free()

func take_damage(bullet):
	HP -= bullet.Damage
	if HP <= 0:
		bullet.destroy(Exp)
		queue_free()
	else:
		bullet.destroy(0)
