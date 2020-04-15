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

	func _init(name, vegetarians, nuclear_power, bicycles):
		self.name = name
		self.vegetarians = vegetarians
		self.nuclear_power = nuclear_power
		self.bicycles = bicycles

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
	Country.new("New Zealand", 0.01, 0.0, 0.21),
	Country.new("Mexico", 0.08, 0.05, 0.03),
	Country.new("Russia", 0.03, 0.17, 0.25),
	Country.new("Chile", 0.06, 0.0, 0.23)
]

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
