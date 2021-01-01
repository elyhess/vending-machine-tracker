require 'rails_helper'
include ActionView::Helpers::NumberHelper

describe 'As a visitor' do
  describe 'When i visit the snack show page' do
    it 'I see the snack and its attributes ' do
      sam = Owner.create(name: "Sam's Snacks")
      machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
      machine_2 = sam.machines.create(location: "Turing Basement")
  
      snack_1 = Snack.create(name: "Cheezit-Grooves", price: 380)
      snack_2 = Snack.create(name: "Cheezit-razorblades", price: 300)
      snack_3 = Snack.create(name: "Cheezit-Smooths", price: 400)
  
      SnackMachine.create(snack: snack_1, machine: machine_1)
      SnackMachine.create(snack: snack_2, machine: machine_1)
      SnackMachine.create(snack: snack_3, machine: machine_1)
      SnackMachine.create(snack: snack_1, machine: machine_2)

      visit snack_path(snack_1)
      save_and_open_page
      expect(page).to have_content(snack_1.name)
      expect(page).to have_content("Price: #{number_to_currency(snack_1.price/100.0)}")

      within("#locations-#{machine_1.id}") do
        expect(page).to have_content(machine_1.location)
        expect(page).to have_content("Average price of: #{number_to_currency(machine_1.snacks.average_price.round(2) / 100.0)}")
        expect(page).to have_content("#{machine_1.snacks.unique_snack_count} kinds of snacks")
      end

      within("#locations-#{machine_2.id}") do
        expect(page).to have_content(machine_2.location)
        expect(page).to have_content("Average price of: #{number_to_currency(machine_2.snacks.average_price.round(2) / 100.0)}")
        expect(page).to have_content("#{machine_2.snacks.unique_snack_count} kinds of snacks")
      end
    end
  end
end
