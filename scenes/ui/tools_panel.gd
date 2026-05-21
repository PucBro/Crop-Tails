extends PanelContainer
@onready var tool_axe: Button = $MarginContainer/HBoxContainer/ToolAxe
@onready var tool_tilling: Button = $MarginContainer/HBoxContainer/ToolTilling
@onready var tool_watering_can: Button = $MarginContainer/HBoxContainer/ToolWateringCan
@onready var tool_corn: Button = $MarginContainer/HBoxContainer/ToolCorn
@onready var tool_tomato: Button = $MarginContainer/HBoxContainer/ToolTomato


func _ready() -> void:
	ToolManager.enable_tool.connect(on_enable_tool_button)
	
	
	tool_tilling.disabled = true
	tool_axe.disabled = true
	tool_tomato.disabled= true
	tool_corn.disabled = true
	tool_watering_can.disabled = true
	
	
	
func _on_tool_watering_can_toggled(toggled_on: bool) -> void:
	if toggled_on:
		ToolManager.select_tool(DataTypes.Tools.WaterCrops)
	else:
		ToolManager.select_tool(DataTypes.Tools.None)


func _on_tool_tilling_toggled(toggled_on: bool) -> void:
	if toggled_on:
		ToolManager.select_tool(DataTypes.Tools.TillGround)
	else:
		ToolManager.select_tool(DataTypes.Tools.None)


func _on_tool_axe_toggled(toggled_on: bool) -> void:
	if toggled_on:
		ToolManager.select_tool(DataTypes.Tools.AxeWood)
	else:
		ToolManager.select_tool(DataTypes.Tools.None)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			ToolManager.select_tool(DataTypes.Tools.None)
			tool_axe.button_pressed = false
			tool_tilling.button_pressed = false
			tool_watering_can.button_pressed = false
			tool_corn.button_pressed = false
			tool_tomato.button_pressed = false


func _on_tool_corn_toggled(toggled_on: bool) -> void:
	if toggled_on:
		ToolManager.select_tool(DataTypes.Tools.PlantCorn)
	else:
		ToolManager.select_tool(DataTypes.Tools.None)


func _on_tool_tomato_toggled(toggled_on: bool) -> void:
	if toggled_on:
		ToolManager.select_tool(DataTypes.Tools.PlantTomato)
	else:
		ToolManager.select_tool(DataTypes.Tools.None)
		
func on_enable_tool_button(tool: DataTypes.Tools)-> void:
	if tool == DataTypes.Tools.TillGround:
		tool_tilling.disabled = false
	elif tool == DataTypes.Tools.WaterCrops:
		tool_watering_can.disabled = false
	elif tool == DataTypes.Tools.AxeWood:
		tool_axe.disabled = false
	elif tool == DataTypes.Tools.PlantCorn:
		tool_corn.disabled = false
	elif tool == DataTypes.Tools.PlantTomato:
		tool_tomato.disabled = false
