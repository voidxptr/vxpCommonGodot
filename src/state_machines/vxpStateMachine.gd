extends Node
class_name vxpStateMachine

@export var state_node:Array[vxpStateMachineState]
@export var state_enum_val:Array[vxpStateMachineState.State]

@onready var state_dict:Dictionary = {

	# in 'STATE : $path/to/state' format
}

func _setup_state_dic()->void:
	assert(state_node.size() == state_enum_val.size(), "state_node.size != state_enum_val.size")
	for index in state_enum_val.size():
		state_dict[state_enum_val[index]] = state_node[index]

var cur_state:vxpStateMachineState.State = vxpStateMachineState.State.Null # TODO: Change to actull start state.

func _ready() -> void:
	_setup_state_dic()

func change_state(next:vxpStateMachineState.State) -> void:
	if next == vxpStateMachineState.State.Null:
		return
	(state_dict[cur_state] as vxpStateMachineState).exit(next)
	(state_dict[next] as vxpStateMachineState).enter(cur_state)
	cur_state = next

func queue_next_state(next:vxpStateMachineState.State) -> void:
	if next == vxpStateMachineState.State.Null:	# so it won't queue a function that won't do anything.
		return
	change_state.call_deferred(next)


func process(delta: float) -> void:
	change_state((state_dict[cur_state] as vxpStateMachineState).process(delta))


func physics_process(delta: float) -> void:
	change_state((state_dict[cur_state] as vxpStateMachineState).physics_process(delta))
