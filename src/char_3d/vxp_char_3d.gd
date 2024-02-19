extends CharacterBody3D
class_name vxpChar3D

@export_category("Camera")
@export var camera:vxpCamera3D

@export_category("StateMachine")
@export var state_machine: vxpChar3DStateMachine


func _physics_process(delta: float) -> void:
	state_machine.physics_process(delta)

func _process(delta: float) -> void:
	state_machine.process(delta)
