extends Node
class_name StateMachine

signal state_changed(new: State)

@export var states: Array[State]
@export var active: State = null

func state_get() -> State:
	return active


func state_set(name: String) -> void:
	var new: State = null
	for state in states:
		if state.state_name == name:
			new = state

	if new == null: 
		push_error("Cannot find name " + name)
		return
	
	# Call the exit for the old active
	active.exit()
	
	# Set and initialise the new active
	active = new
	active.enter()
	
	state_changed.emit(new)


func _ready() -> void:
	if active == null:
		return
	
	state_changed.emit(active)


func _physics_process(delta: float) -> void:
	for state in states:
		if not state is State:
			continue

		state.update(delta)
