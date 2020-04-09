class Waiter

    attr_accessor :name, :year_of_experience

    @@all =[]

    def initialize name, year_of_experience
        @name = name
        @year_of_experience = year_of_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal customer, total, tip
        Meal.new self, customer, total, tip
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        best_tipper_meal = meals.max do |meal1, meal2|
            meal1.tip <=> meal2.tip 
        end
        best_tipper_meal.customer
    end

end