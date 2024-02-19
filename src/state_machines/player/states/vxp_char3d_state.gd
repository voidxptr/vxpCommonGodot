extends Node
class_name vxpChar3DState

@export var player:CharacterBody3D

enum STATE {
	Null, # Used if state should NOT change.
}

func enter(_last:STATE) -> void:
	pass

func physics_process(_delta: float) -> STATE:
	return STATE.Null

func process(_delta: float) -> STATE:
	return STATE.Null

func exit(_next:STATE) -> void:
	pass
