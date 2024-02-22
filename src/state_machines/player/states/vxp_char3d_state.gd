extends Node
class_name vxpChar3DState

@export var player:CharacterBody3D

enum State {
	Null, # Used if state should NOT change.
}

func enter(_last:State) -> void:
	pass

func physics_process(_delta: float) -> State:
	return State.Null

func process(_delta: float) -> State:
	return State.Null

func exit(_next:State) -> void:
	pass
