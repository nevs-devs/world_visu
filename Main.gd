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
	var bicycles

	func _init(name_arg, vegetarians_arg, nuclear_power_arg, bicycles_arg):
		self.name = name_arg
		self.vegetarians = vegetarians_arg
		self.nuclear_power = nuclear_power_arg
		self.bicycles = bicycles_arg

# Country	Percentage Vegetarians	Nuclear Power	Bicycle Drivers
var countries = [
	Country.new("China", 0.04, 0.04, 0.37),
	Country.new("Belgium", 0.07, 0.39, 0.48),
	Country.new("Switzerland", 0.14, 0.36, 0.49),
	Country.new("Japan", 0.04, 0.06, 0.57),
	Country.new("Finland", 0.02, 0.32, 0.6),
	Country.new("Norway", 0.04, 0.0, 0.61),
	Country.new("Sweden", 0.1, 0.4, 0.64),
	Country.new("Germany", 0.1, 0.1, 0.75),
	Country.new("Denmark", 0.05, 0.0, 0.8),
	Country.new("Netherlands", 0.05, 0.03, 0.99),
	Country.new("India", 0.31, 0.03, 0.45),
	Country.new("USA", 0.06, 0.19, 0.32),
	Country.new("Brazil", 0.14, 0.02, 0.07),
	Country.new("Israel", 0.13, 0.0, 0.13),
	Country.new("Australia", 0.12, 0.0, 0.55),
	Country.new("NewZealand", 0.01, 0.0, 0.21),
	Country.new("Mexico", 0.08, 0.05, 0.03),
	Country.new("Russia", 0.03, 0.17, 0.25),
	Country.new("Chile", 0.06, 0.0, 0.23)
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
	_show_percentage(percentages, Color(1.0, 1.0, 1.0), Color(1.0, 1.0, 0.0))

func show_bicycle_drivers():
	var percentages = []
	for country in countries:
		percentages.append(country.bicycles)
	_show_percentage(percentages, Color.red, Color.white)
	
func _on_popup_id_pressed(id: int):
	if _selected_id != id:
		_selected_id = id
		match _selected_id:
			0: show_vegetarians()
			1: show_bicycle_drivers()
			2: show_nuclear_power()
			
		$MenuButton.text = $MenuButton.get_popup().get_item_text(id)
