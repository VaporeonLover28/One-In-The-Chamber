extends Node2D

var fadeinover = false
var instnumber = 1

func _ready() -> void:
	$OICI.visible_ratio = 0
	$inst1.visible_ratio = 0
	$black.color.a = 255
	$black.z_index = 10
	$black.scale.x = 30
	$black.position.x = 0
	$anim.play("fadein")
	await get_tree().create_timer(0.6).timeout
	fadeinover = true
	$anim.play("introductionimgfadein")

func _process(delta: float) -> void:
	if fadeinover == true:
		if $OICI.visible_ratio < 1:
			$OICI.visible_ratio += 0.01
		
		if $OICI.visible_ratio == 1 and $inst1.visible_ratio < 1:
			$inst1.visible == true
			$inst1.visible_ratio += 0.005
		
		if $inst1.visible_ratio == 1:
			if $Inst1.animation != "raisegun":
				$Inst1.play("raisegun")
			$nextinst.visible = true
			$previnst.visible = true
			
		match instnumber:
			1:
				$Inst1.visible = true
				$inst1.visible = true
				$Instball1.visible = true
				
				$Inst2.visible = false
				$inst2.visible = false
				$Instball2.visible = false
				
				$Inst3.visible = false
				$inst3.visible = false
				$Instball3.visible = false
			2:
				$Inst1.visible = false
				$inst1.visible = false
				$Instball1.visible = false
				
				$Inst2.visible = true
				$Inst2.play("wordfloat")
				$inst2.visible = true
				$Instball2.visible = true
				
				$Inst3.visible = false
				$inst3.visible = false
				$Instball3.visible = false
			3:
				$Inst1.visible = false
				$inst1.visible = false
				$Instball1.visible = false
				
				$Inst2.visible = false
				$inst2.visible = false
				$Instball2.visible = false
				
				$Inst3.visible = true
				$Inst3.play("oh yeah woo yeah")
				$inst3.visible = true
				$Instball3.visible = true

func _on_nextinst_button_up() -> void:
	if instnumber > 0 and instnumber < 3:
		instnumber += 1
		$Inst1.frame = 0
		$Inst2.frame = 0
		$Inst3.frame = 0
	elif instnumber == 3:
		get_tree().change_scene_to_file("res://oneinthechamber.tscn")

func _on_previnst_button_up() -> void:
	if instnumber > 1 and instnumber < 4:
		instnumber -= 1
		$Inst1.frame = 0
		$Inst2.frame = 0
		$Inst3.frame = 0
