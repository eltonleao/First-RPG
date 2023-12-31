extends CharacterBody2D
 
var speed = 100
var chase = false
var player;

func _physics_process(delta):
	if chase:
		position += (player.position - position)/speed
		if player.position.distance_to(position) < 20:
			chase = false
	else:
		$AnimatedSprite2D.play("idle")	
		
	
		

func _on_detection_area_body_entered(body):
	player = body;
	$AnimatedSprite2D.play("walk")
	chase = true
	DialogueManager.show_dialogue_balloon(load("res://scripts/main.dialogue"), "start")
	


func _on_detection_area_body_exited(body):
	chase = false
