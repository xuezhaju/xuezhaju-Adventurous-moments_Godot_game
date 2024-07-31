extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite = $AnimatedSprite2D
@onready var jump_sound = $Jump_Sound


func _physics_process(delta):
	# 添加重力
	if not is_on_floor():
		velocity.y += gravity * delta

	# 跳跃
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# 获取水平轴的数值
	var direction = Input.get_axis("move_left", "move_right")

	#检测水平轴数值，判断是否翻转角色
	if direction == 1:
		animated_sprite.flip_h = false
	elif direction == -1:
		animated_sprite.flip_h = true

	#播放动画
	if is_on_floor():  #检测是否在地面上
		if direction == 0:  #未移动角色
			animated_sprite.play("idle")
		else:   #移动角色
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
		#jump_sound.play()
	


	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	move_and_slide()
