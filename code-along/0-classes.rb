# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/0-classes.rb

# String Class

# String Methods


my_favorite_food = "ice cream"
puts my_favorite_food

your_favorite_food = "tacos"
puts your_favorite_food

puts my_favorite_food.capitalize
puts your_favorite_food.capitalize

############ 
class Dog

    def speak
      puts "woof!"
    end
  
  end

  lassie = Dog.new
  lassie.speak
  
  rover = Dog.new
  rover.speak

