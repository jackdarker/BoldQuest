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
	var newTask
	if(room):
		if(!task || (task && task is TaskIdle)):
			if(Global.pc.location.contains(location)):
				newTask=TaskTalk.new()
				if(Global.pc.interuptableByTask(newTask)):
					newTask.charB=Global.pc
					Global.pc.interuptTask()
					assignTask( newTask)
					Global.pc.assignTask(newTask,false)
					newTask.start()
			else:
				newTask=TaskMove.new()
				newTask.target=Util.pickRandomFromArray(Global.World.getConnectedRooms(location))
				assignTask( newTask)
		#if(prevTask && prevTask is TaskIdle):
		#	assignTask(TaskRest.new() )
		#else:
		#	assignTask(TaskIdle.new())
