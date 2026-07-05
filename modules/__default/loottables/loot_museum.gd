extends LootTable

func _init() -> void:
	ID="loot_museum"
	tier=1
	table=[LootTableEntry.create(10,"seashell"),
		LootTableEntry.create(10,"flint"),
	]
