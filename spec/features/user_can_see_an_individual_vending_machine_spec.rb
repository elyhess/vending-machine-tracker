require "rails_helper"

RSpec.describe "When a user visits a vending machine show page", type: :feature do
  scenario "they see the location of that machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it "it shows me all the snacks for that machine" do
    sam = Owner.create(name: "Sam's Snacks")
    machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
    machine_2 = sam.machines.create(location: "Turing Basement")

    snack_1 = Snack.create(name: "Cheezit-Grooves", price: 350)
    snack_2 = Snack.create(name: "Cheezit-razorblades", price: 500)
    snack_3 = Snack.create(name: "Cheezit-Smooths", price: 400)

    SnackMachine.create(snack: snack_1, machine: machine_1)
    SnackMachine.create(snack: snack_2, machine: machine_1)
    SnackMachine.create(snack: snack_3, machine: machine_1)

    visit machine_path(machine_1)

    within("#snack-#{snack_1.id}") do 
      expect(all('.snack-name')[0].text).to eq(snack_1.name)
      expect(all('.snack-price')[0].text).to eq(snack_1.price.to_s)
    end

    within("#snack-#{snack_2.id}") do 
      expect(all('.snack-name')[0].text).to eq(snack_2.name)
      expect(all('.snack-price')[0].text).to eq(snack_2.price.to_s)
    end

    within("#snack-#{snack_3.id}") do 
      expect(all('.snack-name')[0].text).to eq(snack_3.name)
      expect(all('.snack-price')[0].text).to eq(snack_3.price.to_s)
    end

  end


end
