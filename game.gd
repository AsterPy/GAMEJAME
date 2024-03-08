extends Node

var timer_started = false
var elapsed_seconds = 0
var timer_label

# Called when the node enters the scene tree for the first time.
func _ready():
	timer_label =  $CharacterBody2D/Camera2D/TimerLabel
	timer_label.text = "0s"
	start_timer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer_started:
		elapsed_seconds += delta
		timer_label.text = str(int(elapsed_seconds)) + "s"

# Start the timer
func start_timer():
	timer_started = true

# Stop the timer
func stop_timer():
	timer_started = false
	elapsed_seconds = 0
	timer_label.text = "0s"

# Get elapsed seconds
func get_elapsed_seconds():
	return elapsed_seconds
