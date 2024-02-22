extends Node
class_name vxpChar3DStateMachine

@export var state_node:Array[vxpChar3DState]
@export var state_enum_val:Array[vxpChar3DState.State]

@onready var state_dict:Dictionary = {

	# in 'STATE : $path/to/state' format
}

func _setup_state_dic()->void:
	assert(state_node.size() == state_enum_val.size(), "state_node.size != state_enum_val.size")
	for index in state_enum_val.size():
		state_dict[state_enum_val[index]] = state_node[index]

var cur_state:vxpChar3DState.State = vxpChar3DState.State.Null # TODO: Change to actull start state.

func change_state(next:vxpChar3DState.State) -> void:
	if next == vxpChar3DState.State.Null:
		return
	(state_dict[cur_state] as vxpChar3DState).exit(next)
	(state_dict[next] as vxpChar3DState).enter(cur_state)
	cur_state = next

func queue_next_state(next:vxpChar3DState.State) -> void:
	if next == vxpChar3DState.State.Null:	# so it won't queue a function that won't do anything.
		return
	change_state.call_deferred(next)


func process(delta: float) -> void:
	change_state((state_dict[cur_state] as vxpChar3DState).process(delta))


func physics_process(delta: float) -> void:
	change_state((state_dict[cur_state] as vxpChar3DState).physics_process(delta))
