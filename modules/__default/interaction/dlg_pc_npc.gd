extends SceneExtension

const sceneID="dlg_pc_npc"
var avatar_player
var avatar_crab = load("res://assets/images/chars/Crab.png")
const NPC_Format = {"bgcolor":Color.DARK_ORANGE}

func on_enterScene():
	avatar_player = Global.pc.getBustImage()
	parent_scene.__displayImage(1,avatar_player)
	parent_scene.__displayImage(2,Util.createSilhouette(avatar_player))
	pass

func get_buttons(menuid:String,buttons:Array):
	if(menuid==""):
		Global.hud.say("I am "+parent_scene.chars[1].getName())
		buttons.push_back(Button_Config.new("I have to leave","",cb_menu("leave",true)))
	if(menuid=="leave"):
		Global.hud.say("I need to leave.")
		buttons.push_back(Button_Config.new("Leave","",Global.main.removeScene.bind(parent_scene)))
	return(buttons)
