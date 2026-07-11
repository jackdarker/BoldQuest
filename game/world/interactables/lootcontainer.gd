class_name LootContainer extends RoomInteractable

@export var restockTime:=30*60
@export var lootTableID="loot_museum"
var timeSinceLooted:=-1
var loot:Array=[]

func hidden()->int:
	return(0 if timeSinceLooted<0 else 255)

func getAvailableActions(_char:Character)->Array[Task]:
	var _task=TaskLooting.new()
	_task.target=self
	return [_task]

func processTime(_delta:int):
	if(timeSinceLooted>0 && ((Global.main.getTime()-timeSinceLooted)>restockTime)):
		timeSinceLooted=-1

func getLoot()->Array:
	timeSinceLooted=Global.main.getTime()
	return (LootGenerator.generateItems(lootTableID,15,1))
