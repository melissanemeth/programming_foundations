# Question 1

  if false
    greeting = “hello world”
  end
  
  greeting
  
  # returns nil
  # global and instance variables have the value nil before initialization, local variables do not.
  # typically referring to an uninitialized local variable will return "undefined local variable 'xyz'"
  # here it returns nil because because it was initialized within an if block (even if the block doesn't get executed)
  
# Question 2
  
  greetings = { a: 'hi' }
  informal_greeting = greetings[:a]   # here it references the original object
  informal_greeting << ' there'       # then this changes the original object
  
  puts informal_greeting  #  => "hi there"
  puts greetings          # {:a=>"hi there"}
  
  # could either clone greetings or concatenate to preserve original object
  
# Question 3

  def mess_with_vars(one, two, three)
    one = two
    two = three
    three = one
  end
  
  one = "one"
  two = "two"
  three = "three"
  
  mess_with_vars(one, two, three)
  
  puts "one is: #{one}"       # one
  puts "two is: #{two}"       # two
  puts "three is: #{three}"   # three
  puts "-----"
  
  def mess_with_vars_again(one, two, three)
    one = "two"
    two = "three"
    three = "one"
  end
  
  one = "one"
  two = "two"
  three = "three"
  
  mess_with_vars_again(one, two, three)
  
  puts "one is: #{one}"       # one
  puts "two is: #{two}"       # two
  puts "three is: #{three}"   # three
  puts "*****"
  
  def mess_with_vars_gsub(one, two, three)
    one.gsub!("one","two")
    two.gsub!("two","three")
    three.gsub!("three","one")
  end
  
  one = "one"
  two = "two"
  three = "three"
  
  mess_with_vars_gsub(one, two, three)
  
  puts "one is: #{one}"       # two
  puts "two is: #{two}"       # three
  puts "three is: #{three}"   # one
  
# Question 4

  def generate_UUID                                     # define method
    characters = []                                     # create array to hold characters
    (0..9).each { |digit| characters << digit.to_s }    # convert digits to string, add to array
    ('a'..'f').each { |digit| characters << digit }     # add letters a-f to array
  
    uuid = ""                                           # defines uuid as a string
    sections = [8, 4, 4, 4, 12]                         # this array indicates the number of characters in each section of the uuid
    sections.each_with_index do |section, index|        # for each section
      section.times { uuid += characters.sample }       # add as many characters to uuid as indicated in the section
      uuid += '-' unless index >= sections.size - 1     # put a dash after each section unless it's the last one
    end
  
    uuid                                                # return uuid
  end

  puts generate_UUID
  
# Question 5

  # def dot_separated_ip_address?(input_string)
  #   dot_separated_words = input_string.split(".")
  #   while dot_separated_words.size > 0 do
  #     word = dot_separated_words.pop
  #     break if !is_a_number?(word)                    # once this breaks, it falls through to return true statement
  #   end
  #   return true
  # end
  
  def dot_separated_ip_address?(input_string)
    dot_separated_words = input_string.split(".")       # split the string at each .
    return false unless dot_separated_words.size == 4   # handle cases where string is more/less than 4
  
    while dot_separated_words.size > 0 do               # so long as there's a string to check
      word = dot_separated_words.pop                    # get the last element from the array
      return false unless is_a_number?(word)            # check if that element is a number, return false otherwise
    end
  
    true                                                # if this isn't here it will return nil
  end