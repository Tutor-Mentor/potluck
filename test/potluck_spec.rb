require './lib/dish'
require './lib/potluck'

RSpec.describe Potluck do
  let(:date) { "7-13-18" } # same as date = "7-13-18"
  let(:dishes) { [] }
  let(:potluck) { Potluck.new(date) }
  let(:cocktail_meatballs) { Dish.new("Cocktail Meatballs", :entre) }
  let(:summer_pizza) { Dish.new("Summer Pizza", :appetizer) }
  let(:roast_pork) { Dish.new("Roast Pork", :entre) }
  let(:candy_salad) { Dish.new("Candy Salad", :dessert) }
  let(:bean_dip) { Dish.new("Bean Dip", :appetizer) }


  let(:couscous_salad) { Dish.new("Couscous Salad", :appetizer) }

  describe '#initialize' do
    it 'returns a date' do

      expect(potluck.date).to eq(date)
    end

    it 'returns an array' do

      expect(potluck.dishes).to eq([])
    end
  end

  describe '#add_dish' do
    before do
      potluck.add_dish(couscous_salad)
      potluck.add_dish(cocktail_meatballs)
    end

    it 'returns an array of dishes' do

      expect(potluck.dishes).to eq([couscous_salad, cocktail_meatballs])
      expect(potluck.dishes.length).to eq(2)
    end
  end

  describe '#get_all_from_category' do
    before do
      potluck.add_dish(couscous_salad)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(candy_salad)
    end

    it 'returns records from given category' do

      expect(potluck.get_all_from_category(:appetizer)).to eq([couscous_salad, summer_pizza])
      expect(potluck.get_all_from_category(:appetizer).first).to eq(couscous_salad)
      expect(potluck.get_all_from_category(:appetizer).first.name).to eq("Couscous Salad")
    end
  end

  describe '#menu' do
    let(:hash_menu) { {
      appetizers: [couscous_salad, summer_pizza, bean_dip],
      entres: [roast_pork, cocktail_meatballs],
      desserts: [candy_salad]
      } }
    before do
      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)
      potluck.add_dish(bean_dip)
    end

    it 'returns a hash' do

      expect(potluck.menu).to eq(hash_menu)
    end

    it 'returns a ratio' do

      expect(potluck.ratio(:appetizer)).to eq(50.0)
    end
  end

end
