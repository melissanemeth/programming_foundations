# Question 1
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
  puts ages.has_key?('Spot')
  # could also use include? or member?
  
# Question 2
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
  puts ages.values.inject(:+)
  # .values makes an array, .inject combines all elements of enum by applying a binary operation,
  # specified by a block or a symbol that names a method or operator, :+ is the symbol that specifies
  # the method to use (in this case, add).
  
# Question 3
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
  ages.delete_if { |k,v| v > 100 }
  puts ages
  # can also use keep_if
  
# Question 4
  munsters_description = "The Munsters are creepy in a good way."
  puts munsters_description.capitalize!
  puts munsters_description.swapcase!
  puts munsters_description.downcase!
  puts munsters_description.upcase!
  
# Question 5
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
  additional_ages = { "Marilyn" => 22, "Spot" => 237 }
  ages.merge!(additional_ages)
  puts ages
  
# Question 6
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
  puts ages.values.min
  
# Question 7
  advice = "Few things in life are as important as house training your pet dinosaur."
  puts advice.include?("Dino")
  # can also use .match, will return nil here
  
# Question 8
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  puts flintstones.index{|s| s.start_with?("Be")}
  # Launch School solution: flintstones.index { |name| name[0, 2] == "Be" }
  
# Question 9
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  flintstones.map! do |name|
    name[0, 3]
  end
  puts flintstones
  
# Question 10
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  flintstones.map! { |name| name[0, 3] }
  puts flintstones