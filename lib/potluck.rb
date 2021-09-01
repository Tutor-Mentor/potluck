class Potluck
  attr_reader :date,
              :dishes

  def initialize(date)
    @date   = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes.push(dish)
  end

  def get_all_from_category(category)
    @dishes.select do |dish|
      dish.category == category
    end
  end

  def menu
    {
      appetizers: get_all_from_category(:appetizer),
      entres: get_all_from_category(:entre),
      desserts: get_all_from_category(:dessert)
    }
  end

  def ratio(category)
    dishes = get_all_from_category(category)

    (dishes.length / @dishes.length.to_f) * 100
  end
end
