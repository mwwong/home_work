require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:sugar)  { Dessert.new("sugar", 30, chef) }
  let(:chef) { double("Ramsay") }
  
  describe "#initialize" do
    it "sets a type" do 
      expect(sugar.type).to eq('sugar')
    end
    it "sets a quantity" do
      expect(sugar.quantity).to eq(30)
    end
    it "starts ingredients as an empty array" do
      expect(sugar.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
    expect { Dessert.new("sugar", "some quantity", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      sugar.add_ingredient("milk")
      expect(sugar.ingredients).to include("milk")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
        sugar.add_ingredient("milk")
        sugar.add_ingredient("cream")
        sugar.add_ingredient("fruits")
        dup_ingredient = sugar.ingredients.dup
        sugar.mix!
        expect(sugar.ingredients).to_not eq(dup_ingredient)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
        expect(sugar.eat(10)).to eq(20)
    end 
    it "raises an error if the amount is greater than the quantity" do
        expect{ sugar.eat(50) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize).and_return("Chef Ramsay the Great Baker")
      expect(sugar.serve).to eq("Chef Ramsay the Great Baker has made 30 sugars!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(sugar)
      sugar.make_more
    end
  end
end