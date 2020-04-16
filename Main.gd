extends Node2D

# SHOW ME WHAT YOU GOT!
#        ___          
#    . -^   `--,      
#   /# =========`-_   
#  /# (--====___====\ 
# /#   .- --.  . --.| 
#/##   |  * ) (   * ),
#|##   \    /\ \   / |
#|###   ---   \ ---  |
#|####      ___)    #|
#|######           ##|
# \##### ---------- / 
#  \####           (  
#   `\###          |  
#     \###         |  
#      \##        |   
#       \###.    .)   
#        `======/

class Country:
	var name
	var vegetarians
	var nuclear_power
	var motor_vehicles

	func _init(name_arg, vegetarians_arg, nuclear_power_arg, motor_vehicles_arg):
		self.name = name_arg
		self.vegetarians = vegetarians_arg
		self.nuclear_power = nuclear_power_arg
		self.motor_vehicles = motor_vehicles_arg

# Country	Percentage Vegetarians	Nuclear Power	Motor Vehicles per capita
var countries = [
	Country.new("China", 0.04, 0.04, 0.18),
	Country.new("Belgium", 0.07, 0.39, 0.5),
	Country.new("Switzerland", 0.14, 0.36, 0.71),
	Country.new("Japan", 0.04, 0.06, 0.61),
	Country.new("Finland", 0.02, 0.32, 0.75),
	Country.new("Norway", 0.04, 0.0, 0.61),
	Country.new("Sweden", 0.1, 0.4, 0.51),
	Country.new("Germany", 0.1, 0.1, 0.56),
	Country.new("Denmark", 0.05, 0.0, 0.43),
	Country.new("Netherlands", 0.05, 0.03, 0.48),
	Country.new("India", 0.31, 0.03, 0.022),
	Country.new("USA", 0.06, 0.19, 0.83),
	Country.new("Brazil", 0.14, 0.02, 0.35),
	Country.new("Israel", 0.13, 0.0, 0.38),
	Country.new("Australia", 0.12, 0.0, 0.73),
	Country.new("NewZealand", 0.01, 0.0, 0.86),
	Country.new("Mexico", 0.08, 0.05, 0.29),
	Country.new("Russia", 0.03, 0.17, 0.38),
	Country.new("Chile", 0.06, 0.0, 0.23),
	Country.new("Canada", 0.09, 0.16, 0.68),
	Country.new("France", 0.05, 0.71, 0.47),
	Country.new("Spain", 0.01, 0.2, 0.64),
]

var _selected_id: int = -1

func _ready():
	$MenuButton.get_popup().add_item("vegetarians", 0)
	$MenuButton.get_popup().add_item("nuclear_power", 1)
	$MenuButton.get_popup().add_item("bicycles", 2)
	$MenuButton.get_popup().connect("id_pressed", self, "_on_popup_id_pressed")
	_on_popup_id_pressed(0)
	
func _percentage_to_color(percentage, min_color, max_color):
	var min_color_vec = Vector3(min_color.r, min_color.g, min_color.b)
	var max_color_vec = Vector3(max_color.r, max_color.g, max_color.b)
	var color_change_vec = max_color_vec - min_color_vec
	var new_color = min_color_vec + color_change_vec * percentage
	return Color(new_color.x, new_color.y, new_color.z, 1.0)

func _show_percentage(percentages, min_color, max_color):
	var min_percentage = 1.0
	var max_percentage = 0.0
	for p in percentages:
		min_percentage = min(min_percentage, p)
		max_percentage = max(max_percentage, p)

	for i in range(len(percentages)):
		var country = countries[i]
		var node = get_node("World/" + country.name)
		var percentage = range_lerp(percentages[i], min_percentage, max_percentage, 0.0, 1.0)
		node.modulate = _percentage_to_color(percentage, min_color, max_color)

func show_vegetarians():
	var percentages = []
	for country in countries:
		percentages.append(country.vegetarians)
	_show_percentage(percentages, Color(1.0, 1.0, 1.0), Color(0.0, 0.7, 0.0))

func show_nuclear_power():
	var percentages = []
	for country in countries:
		percentages.append(country.nuclear_power)
	_show_percentage(percentages, Color.white, Color(1.0, 0.0, 0.0))

func show_motor_vehicles():
	var percentages = []
	for country in countries:
		percentages.append(country.motor_vehicles)
	_show_percentage(percentages, Color.white, Color.indigo)
	
func _on_popup_id_pressed(id: int):
	if _selected_id != id:
		_selected_id = id
		match _selected_id:
			0: show_vegetarians()
			1: show_nuclear_power()
			2: show_motor_vehicles()
		$MenuButton.text = $MenuButton.get_popup().get_item_text(id)
