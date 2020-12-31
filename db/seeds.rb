# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


sam = Owner.create(name: "Sam's Snacks")
machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
machine_2 = sam.machines.create(location: "Turing Basement")

snack_1 = Snack.create(name: "Cheezit-Grooves", price: 350)
snack_2 = Snack.create(name: "Cheezit-razorblades", price: 500)
snack_3 = Snack.create(name: "Cheezit-Smooths", price: 400)

SnackMachine.create(snack: snack_1, machine: machine_1)
SnackMachine.create(snack: snack_2, machine: machine_1)
SnackMachine.create(snack: snack_3, machine: machine_1)