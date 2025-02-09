extends TextureButton
class_name Plot

@export var overlay: Control
@export var active_name: Label

@export var hide_others: bool = true

@export var machine: StateMachine

func on_self_pressed() -> void:
	# Only God can forgive me for this sin
	if hide_others:
		for child in get_parent().get_children():
			if not child is Plot:
				continue

			child.overlay.visible = false

		overlay.visible = true


func on_leave_pressed() -> void:
	if machine.state_get().state_name == "Busy":
		return

	overlay.visible = false


func on_state_machine_state_changed(new: State) -> void:
	if new.state_name == "Busy":
		return

	active_name.text = new.state_name


func on_plant_pressed() -> void:
	machine.state_set("Busy")
