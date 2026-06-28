extends CombatSkill

func _init():
	super()
	ID="Skill_Slash"
	tags.push_back(SkillTagEnum.Attack)

func getName()->String:
	return "Slash"

func getDescription()->String:
	return "Cut them with your weapon."

func applyAction(_action:String,_target:Character):
	var _res=Result.create(true,"")
	_target.getStat(StatEnum.Pain).modify(15)
	GR.createEffect("eff_bleed").applyTo(_target)
	_res.Msg=user.getName() +" hits " + _target.getName()+" cause some bleeding." 
	Global.hud.say(_res.Msg)
