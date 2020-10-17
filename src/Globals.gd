extends Node

const MAIN_MENU_PATH = "res://levels/Main.tscn"


# ------------------------------------
# All of the GUI/UI related variables

const POPUP_SCENE = preload("res://UI/Pause.tscn")
var popup = null

# A canvas layer node so our GUI/UI is always drawn on top
var canvas_layer = null

const DEBUG_DISPLAY_SCENE = preload("res://UI/Debug.tscn")
var debug_display = null

# ------------------------------------


var respawn_points = null


# ------------------------------------
# All of the audio files.

var audio_clips = {
	"ambient": preload("res://assets/audio/Breadventure_sketch_1.wav"),
	"rifle_shot": preload("res://assets/audio/Gun_sfx_3.wav"),
	"alien": preload("res://assets/audio/test-alien.ogg"),

	"ammunition_pickup": preload("res://assets/audio/Ammunition_Pickup.wav"),
	"concrete_boots_walking": preload("res://assets/audio/Concrete_Boots_Walking.wav"),
	"concrete_boots_running": preload("res://assets/audio/Concrete_Boots_Running.wav"),
	"gun_sfx_3": preload("res://assets/audio/Gun_sfx_3.wav"),
	"explosion": preload("res://assets/audio/Explosion.wav"),
	"explosion_1_scecond_long": preload("res://assets/audio/Explosion_-_1_second_long.wav"),
}

const SIMPLE_AUDIO_PLAYER_SCENE = preload("res://UI/MonoAudioPlayer.tscn")
const AUDIO_PLAYER_SCENE_3D = preload("res://UI/AudioPlayer3D.tscn")

# A list to hold all of the created audio nodes
var created_audio = []

# ------------------------------------


func _ready():
	# Randomize the random number generator, so we get random values
	randomize()
	
	# Make a new canvas layer.
	# This is so our popup always appears on top of everything else
	canvas_layer = CanvasLayer.new()
	add_child(canvas_layer)


func load_new_scene(new_scene_path):
	respawn_points = null
	
	# Delete all of the sounds
	for sound in created_audio:
		if (sound != null):
			sound.queue_free()
	created_audio.clear()
	
	# Change scenes
	var _result = get_tree().change_scene(new_scene_path)


func _process(_delta):
	if Input.is_action_just_pressed("ui_pause"):
		if popup == null:
			popup = POPUP_SCENE.instance()

			canvas_layer.add_child(popup)
			popup.popup_centered()

			popup.connect("resume", self, "popup_closed")
			popup.connect("popup_hide", self, "popup_closed")
			popup.connect("quit", self, "popup_quit")

			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

			get_tree().paused = true


func popup_closed():
	get_tree().paused = false
	
	if popup != null:
		popup.queue_free()
		popup = null

func popup_quit():
	get_tree().paused = false
	
	# Make sure the mouse is visible
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	# If we have a popup, destoy it
	if popup != null:
		popup.queue_free()
		popup = null
	
	# Go back to the title screen scene
	load_new_scene(MAIN_MENU_PATH)


func set_debug_display(display_on: bool):
	# If we are turning off the debug display
	if display_on == false:
		# If we have a debug display, then free it and set debug_display to null
		if debug_display != null:
			debug_display.queue_free()
			debug_display = null
	# If we are turning on the debug display
	else:
		# If we do not have a debug display, instance/spawn a new one and set it to debug_display
		if debug_display == null:
			debug_display = DEBUG_DISPLAY_SCENE.instance()
			canvas_layer.add_child(debug_display)


func play_sound(sound_name, loop_sound=false, sound_position=null):
	# If we have a audio clip with with the name sound_name
	if audio_clips.has(sound_name):
		var manage_audio = true

		var audio_resource = audio_clips[sound_name]

		var new_audio
		if sound_position == null:
			new_audio = SIMPLE_AUDIO_PLAYER_SCENE.instance()
		elif sound_position is Vector3:
			new_audio = AUDIO_PLAYER_SCENE_3D.instance()
		elif sound_position is Spatial:
			manage_audio = false
			new_audio = sound_position
		else:
			print("ERROR: sound_position not implemented")

		new_audio.should_loop = loop_sound

		if manage_audio:
			add_child(new_audio)
			created_audio.append(new_audio)

		new_audio.play_sound(audio_resource, sound_position)
	
	# If we do not have an audio clip with the name sound_name, print a error message
	else:
		print ("ERROR: cannot play sound that does not exist in audio_clips!")

