class_name DungeonRoom extends Node2D

@export var roomName := ""	#leave mepty to auto-generate
@export var roomID := ""	#id needs to be unique in world; leave mepty to auto-generate
@export_multiline var roomDescription := ""
@export_multiline var blindRoomDescription := ""
@export var canWest = true
@export var canNorth = true
@export var canEast = true
@export var canSouth = true
var lastVisited:int=0
var lootAvailable:=false

signal onEnter(room)
signal onPreEnter(room)
#signal onReact(room, key)

var astarID
@export var astarConnectedTo:Array[String]= []	# this is used by NPC; add ActionLeave for PC!
var astarConnections:Array = []

var NPCIcon=preload("res://game/world/interactables/npc.tscn")

func _ready() -> void:
	if(!roomID):
		roomID = getFloorID()+"@"+name	# "DngABC_Floor1@Room 1
	if(!roomName):
		roomName = name

## you have to add Action...-Nodes to the room for this 
# some rooms might extend this to add built-in actions
func updateHudActions():
	var actions = get_children().filter(func(x): return (x is RoomAction))
	for action in actions:
		if(action.hidden()==0):
			Global.hud.addButton(action.label, action.get_tooltip(),action.run,action.can_run )
	actions = get_children().filter(func(x): return (x is RoomInteractable))
	for action:RoomInteractable in actions:
		if(action.hidden()==0):
			action.visible=true
			for _task in action.getAvailableActions(Global.pc):
				Global.hud.addButton(_task.label, _task.get_tooltip(),Global.pc.assignTask.bind(_task),_task.canRun )
		else:
			action.visible=false

func processTime(_dt:int):
	var _mobsOld=get_children().filter(func(x):return(x is NPCIcon))
	var _mobsHere=getFloor().Mobs.values().filter(func(x): return(x.location==roomID))
	var _mobsNew=[]
	#remove icon from removed NPC
	var _mobsOld2=_mobsOld.filter(func(x):return (!_mobsHere.any(func(y):return(y.uniqueID==x.ID))))
	for _mob in _mobsOld2:
		remove_child(_mob)
		_mob.queue_free()
	#add icons from new NPC
	_mobsHere=_mobsHere.filter(func(x):return(!_mobsOld.any(func(y):return(y.ID==x.uniqueID))))
	for _mob:Character in _mobsHere:
		var _icon:=NPCIcon.instantiate()
		_icon.ID=_mob.uniqueID
		_icon.label=_mob.getName()
		add_child(_icon)


func _onPreEnter():
	emit_signal("onPreEnter", self)

func _onEnter():
	lastVisited=Global.main.getTime()
	updateHudActions()
	emit_signal("onEnter", self)

func setHighlighted(high):
		$room.self_modulate=GameWorld.HIGHLIGHT if(high) else Color.WHITE

func getFloorID():
	return getFloor().ID
	
func getFloor()->DungeonFloor:
	var myParent = get_parent()
	while(!myParent.has_method("getRooms")):
		myParent = myParent.get_parent()
	return myParent

func getScene()->Node:
	var myParent = get_parent()
	while(!myParent.has_method("getRooms")):
		myParent = myParent.get_parent()
	return myParent

## returns coordinated of the room on the floor
func getCell() -> Vector2:
	return Vector2(round(global_position.x / GameWorld.GRID), round(global_position.y / GameWorld.GRID))

func hasLoot()->bool:
	return lootAvailable
