extends CharacterBody2D


const SPEED = 100
var current_dir = "none";


func _ready():
	$AnimatedSprite2D.play("idle")

func _physics_process(delta):
	player_movement(delta)


func player_movement(delta):
	if(Game.is_dialogue_playing):
		play_anim(0)
		return;
	if Input.is_action_pressed('ui_right'):
		play_anim(1)
		current_dir = "right"
		velocity.x = SPEED
		velocity.y = 0
	elif Input.is_action_pressed('ui_left'):
		play_anim(1)
		current_dir = "left"
		velocity.x = -SPEED
		velocity.y = 0
	elif Input.is_action_pressed('ui_down'):
		play_anim(1)
		current_dir = "down"
		velocity.y = SPEED
		velocity.x = 0
	elif Input.is_action_pressed('ui_up'):
		play_anim(1)
		current_dir = "up"
		velocity.y = -SPEED
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()


func play_anim(movement):
	var dir = current_dir;
	var anim = $AnimatedSprite2D;
	if dir == "right":
		anim.flip_h = false;
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	
	if dir == "left":
		anim.flip_h = true;
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
			
	if dir == "down":
		anim.flip_h = true;
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			anim.play("idle")
	if dir == "up":
		anim.flip_h = true;
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			anim.play("back_idle")
		
			
			
	
	
