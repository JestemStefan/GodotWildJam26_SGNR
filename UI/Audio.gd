extends Node2D

var globals

const AUDIO_ITEM = preload("res://UI/AudioItem.tscn")

onready var play_list = $CenterContainer/MusicList

# Called when the node enters the scene tree for the first time.
func _ready():
	globals = get_node("/root/Globals")

	var clips = globals.audio_clips
	for clip in clips:

		var item = AUDIO_ITEM.instance()
		item.setValues(clip, globals.audio_clips[clip].resource_path)
		item.connect("play", self, "_clip_pressed", [clip])
		play_list.add_child(item)


func _clip_pressed(clip):
	globals.play_sound(clip)
