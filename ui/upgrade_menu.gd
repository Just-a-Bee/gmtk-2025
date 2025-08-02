extends Control
@onready var options = $Upgrades
@onready var main:Main = get_parent()

func display_upgrade(index, upgrade):
	options.show()
	$CodeEditorWindow.hide()
	var option = options.get_child(index)
	option.set_text(upgrade.type, upgrade.get_text())
	option.upgrade = upgrade

var selected_index := 0
func upgrade_clicked(index, upgrade):
	selected_index = index
	options.hide()
	$CodeEditorWindow.show()
	is_inserting_code = true
	selected_upgrade = upgrade
	insert_index = 0
	update_code_window_text()
	

var is_inserting_code := false
var insert_index := 0
var selected_upgrade:Block = null

func update_code_window_text():
	var text = "void loop():\n"
	for i in insert_index:
		text += "\t" + main.loop_arr[i].text
	text += "[color=GREEN]+\t" + selected_upgrade.text + "[/color]"
	for i in main.loop_arr.size()-insert_index:
		text += "\t" + main.loop_arr[i+insert_index].text
	%CodeEditText.text = text

func _input(event):
	if not is_inserting_code:
		return
	if event.is_action_pressed("ui_up"):
		insert_index = max(0, insert_index - 1)
		update_code_window_text()
	if event.is_action_pressed("ui_down"):
		insert_index = min(insert_index + 1, main.loop_arr.size()-1)
		update_code_window_text()
	if event.is_action_pressed("ui_accept"):
		insert_code()

func insert_code():
	get_parent().select_upgrade(selected_index, selected_upgrade, insert_index)
	is_inserting_code = false
