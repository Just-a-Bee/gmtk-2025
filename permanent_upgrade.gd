# Resource for permanent upgrades displayed in "garbage data" shop

extends Resource
class_name PermanentUpgrade

@export var icon : Texture2D
@export var name := ""
@export var tooltip := ""
@export var cost_array : Array[int] = []

@export var value_array : Array[int] = []
@export var text_before := ""
@export var text_after := ""

@export var upgrade_index = 0
