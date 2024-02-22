extends Camera3D
class_name vxpCamera3D

@export_category("Mouse")
@export var mouse_rotation:bool = true
@export var mouse_sens:Vector2 = Vector2(0.01, 0.01)
@export var capture_mode:Input.MouseMode = Input.MOUSE_MODE_CAPTURED:
	set(new): # INFO: Use the set function so that the mouse mode get updated.
		Input.mouse_mode = new
		capture_mode = new

@export_category("JoyStick")
@export var joystick_rotation:bool = false
@export var joystick_sens:Vector2 = Vector2(0.01, 0.01)

@export_category("RotationClamp")
@export var max_yaw:float = PI
@export var min_yaw:float = -PI

@export var max_pitch:float = 0.5*PI
@export var min_pitch:float = -0.5*PI

@export var lock_yaw:bool = false # TODO: Insert super funny Joke here.
@export var lock_pitch:bool = true

@export_category("RotationObjects")
@export var yaw_object:Node3D
@export var pitch_object:Node3D


func rotate_with_camera_y(vec:Vector3)->Vector3:
	return vec.rotated(Vector3.UP, yaw_object.rotation.x)

func camara_view_dir_y_only()->Vector3:
	return rotate_with_camera_y(Vector3.FORWARD)


func rotate_with_camara(vec:Vector3)->Vector3:
	return rotate_with_camera_y(vec).rotated(Vector3.LEFT, pitch_object.rotation.y) # There is most likely a more efficient way of dooing this.

func camera_view_dir()->Vector3:
	return rotate_with_camara(Vector3.FORWARD) # There is most likely a more efficient way of dooing this.


func _ready() -> void:
	Input.mouse_mode = capture_mode

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if mouse_rotation: # WARNING: This is not resolution Independent (yet).
			yaw_object.rotate_y(-event.relative.x * mouse_sens.x)
			pitch_object.rotate_x(-event.relative.y * mouse_sens.y)
		if joystick_rotation:
			pass # TODO: Implement this.

		if lock_pitch:
			pitch_object.rotation.x = min(max(pitch_object.rotation.x, min_pitch), max_pitch)
		if lock_yaw:
			yaw_object.rotation.y = min(max(yaw_object.rotation.y, min_yaw), max_yaw)
