class_name MobLizardman extends Character


func _init():
	super()
	getStat(StatEnum.Pain).ul=120
	self.ID="Lizardman"
	self.combatAI=CombatAIBase.new()
	self.combatAI.char=self

func getBustImage()->Texture2D:
	return load("res://assets/images/chars/lizardman.png")

func think():
	var room=Global.World.getRoomByID(location)
	if(room):
		if(prevTask && prevTask is TaskIdle):
			assignTask(TaskRest.new())
		else:
			assignTask(TaskIdle.new())
	pass
