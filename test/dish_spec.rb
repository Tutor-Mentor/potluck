require './lib/dish'

RSpec.describe Dish do
  let(:name) { "Couscous Salad" } # same as name = "Couscous Salad"
  let(:appetizer) { :appetizer }
  let(:dish) { Dish.new(name, appetizer) }

  describe '#initialize' do
    it 'returns a name' do

      expect(dish.name).to eq(name)
    end

    it 'returns a category' do

      expect(dish.category).to eq(appetizer)
    end
  end

end
