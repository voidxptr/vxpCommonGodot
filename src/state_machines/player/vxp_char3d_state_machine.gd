extends Node
class_name vxpChar3DStateMachine

@onready var state_dict:Dictionary = {

	# in STATE : $path/to/state format
}

var cur_state:vxpChar3DState.STATE = vxpChar3DState.STATE.Null # TODO: Change to actull start state.

func change_state(next:vxpChar3DState.STATE) -> void:
	if next == vxpChar3DState.STATE.Null:
		return
	(state_dict[cur_state] as vxpChar3DState).exit(next)
	(state_dict[next] as vxpChar3DState).enter(cur_state)
	cur_state = next

func quue_next_state(next:vxpChar3DState.STATE) -> void:
	if next == vxpChar3DState.STATE.Null:	# so it won't cue a function that won't do anything.
		return
	change_state.call_deferred(next)


func process(delta: float) -> void:
	change_state((state_dict[cur_state] as vxpChar3DState).process(delta))

func physics_process(delta: float) -> void:
	change_state((state_dict[cur_state] as vxpChar3DState).physics_process(delta))
