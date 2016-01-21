# Question 1
  flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  
# Question 2
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  flintstones << "Dino"
  puts flintstones
  
# Question 3
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  flintstones.push("Dino").push("Hoppy")
  puts flintstones
  
# Question 4
  advice = "Few things in life are as important as house training your pet dinosaur."
  advice.slice!(0..38)
  puts advice
  
# Question 5
  statement = "The Flintstones Rock!"
  count = statement.scan('t').count
  puts count
  
# Question 6
  title = "Flintstone Family Members"
  centered = title.center(40)
  puts centered