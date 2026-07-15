class_name LootContainer extends RoomInteractable

@export var restockTime:=30*60
@export var lootTableID="loot_museum"

var timeSinceLooted:=-1
var loot:Array=[]

func _ready() -> void:
	super()
	if(label=="" || label=="some action"):
		label= "small box"

func getIconOffset()->Vector2:
	return Vector2(1,-1)
	

func getAvailableActions(_char:Character)->Array[Task]:
	var _task=TaskLooting.new()
	_task.target=self
	return [_task]

func processTime(_delta:int):
	if(timeSinceLooted>0 && ((Global.main.getTime()-timeSinceLooted)>restockTime)):
		timeSinceLooted=-1
		self.set_hidden(0)

func getLoot()->Array:
	timeSinceLooted=Global.main.getTime()
	return (LootGenerator.generateItems(lootTableID,15,1))

# TODO some containers get hidden and respawn, others completly vanish
func lootContainer():
	timeSinceLooted=Global.main.getTime()
	set_hidden(255)
