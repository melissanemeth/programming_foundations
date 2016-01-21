# Question 1
  numbers = [1, 2, 2, 3]
  numbers.uniq
  
  puts numbers # Outputs 1 2 2 3

# Question 2
  # The bang sign means "the bang version is more dangerous than its non bang counterpart; handle with care". - Matz
  # ? tests truthiness, returns boolean
  # != means 'not equal', this is used in comparisons
  # ! before something (like !user_name) changes to it's boolean opposite
  # ? : is the ternary operator, used in place of if... else
  # !!object turns it into it's boolean equivalent
  
# Question 3
  advice = "Few things in life are as important as house training your pet dinosaur."
  advice.gsub!('important', 'urgent')
  puts advice

# Question 4
  numbers = [1, 2, 3, 4, 5]
  numbers.delete_at(1) # deletes item at position 1 (in this case, '2')
  numbers.delete(1) # deletes all items equal to '1'
  
# Question 5
  if 42 >  10 && 42 < 100
    puts true
  else
    puts false
  end
  # using range object
  in_range = (10..100).cover?(42)
  puts in_range
  
# Question 6
  famous_words = "seven years ago..."
  puts "Four score and " + famous_words
  puts famous_words.prepend("Four score and ")
  
# Question 7
  def add_eight(number)
    number + 8
  end
  
  number = 2
  
  how_deep = "number"
  5.times { how_deep.gsub!("number", "add_eight(number)") }
  
  p how_deep
  puts eval(how_deep)
  
# Question 8
  flintstones = ["Fred", "Wilma"]
  flintstones << ["Barney", "Betty"]
  flintstones << ["BamBam", "Pebbles"]
  puts flintstones
  puts "-----"
  flintstones.flatten!
  puts flintstones
  puts "-----"
  
# Question 9
  flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
  puts flintstones.assoc("Barney")
  
# Question 10
  flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
  flintstones_hash = {}
  flintstones.each_with_index do |name, index|
    flintstones_hash[name] = index
  end
  puts flintstones_hash
  # to_h will convert nested arrays to k,v pairs