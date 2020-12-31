require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'validations' do
    # it { should validate_presence_of :}
  end

  describe 'relationships' do
    it {should have_many :snack_machines}
    it {should have_many :machines}
  end

  describe 'instance methods' do
  end

  describe "class methods" do
    it '::average_price' do
      sam = Owner.create(name: "Sam's Snacks")
      machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
  
      snack_1 = Snack.create(name: "Cheezit-Grooves", price: 350)
      snack_2 = Snack.create(name: "Cheezit-razorblades", price: 300)
      snack_3 = Snack.create(name: "Cheezit-Smooths", price: 400)
  
      SnackMachine.create(snack: snack_1, machine: machine_1)
      SnackMachine.create(snack: snack_2, machine: machine_1)
      SnackMachine.create(snack: snack_3, machine: machine_1)
      
      expect(Snack.average_price).to eq(350)
    end
  end 
end