extends Area2D

class_name Tower

export var Normal = Color(1, 1, 1)
export var MouseOver = Color(1.2, 1.2, 1.2)
var Target = []
export var TimeLimit = 1.5
var CoolTime = 1.5
export var MaxAmmo = 2
var Ammo = 2
var Grade = 1
export var UpGradeExp = 100
var GradeExp = 0


func _ready():
	$Cannon.rotation = -PI / 2


func _process(delta):
	CoolTime += delta
	if len(Target) != 0:
		$Cannon.rotation = Target[0].global_position.angle_to_point($Cannon.global_position)
		if Ammo > 0 and CoolTime >= TimeLimit:
			shoot()


#func setup(pos):
#	position = pos


func shoot():
	pass


func ammo_recover(Exp):
	GradeExp += Exp
	if GradeExp >= UpGradeExp and Grade == 1:
		Grade = 2
	if Ammo < MaxAmmo:
		Ammo += 1


func display_range(on):
	if on:
		$Range.visible = true
		$Base.set_modulate((MouseOver))
		$Cannon.set_modulate(MouseOver)
	else:
		$Range.visible = false
		$Base.set_modulate(Normal)
		$Cannon.set_modulate(Normal)


func add_target(area):
	Target.append(area)
#	print(Target)


func erase_target(area):
	if Target.has(area):
		Target.erase(area)
#		print(Target)
