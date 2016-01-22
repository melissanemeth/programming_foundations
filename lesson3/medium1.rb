# Question 1
  10.times { |x| puts (" " * x) + "The Flintstones Rock!" }
  
# Question 2
  statement = "The Flintstones Rock"
  result = {}                                                     # create empty hash to hold result
  letters = ('A'..'Z').to_a + ('a'..'z').to_a                     # create arrays of alphabet, caps and lowercase
  letters.each do |letter|                                        # for each letter
    letter_frequency = statement.scan(letter).count               # scan the statement for each letter and count them, hold in new variable
    result[letter] = letter_frequency if letter_frequency > 0     # show the result so long as there is a count for that letter
  end
  puts result
  
# Question 3
  # what are the errors in this statement and how would you fix it?
  # puts "the value of 40 + 2 is " + (40 + 2)
  # Can't concatenate integers to a string
  # puts means 'put string'
  puts "the value of 40 + 2 is " + (40 + 2).to_s
  # or puts "the value of 40 + 2 is #{40 + 2}"
  
# Question 4
  numbers = [1, 2, 3, 4]
  numbers.each do |number|
    p number
    numbers.shift(1)
  end
  # outputs 1, 3, so does numbers.shift()
  
  numbers = [1, 2, 3, 4]
  numbers.each_with_index do |number, index|
    p "#{index}  #{numbers.inspect}  #{number}"
    numbers.shift(1)
  end
  # outputs "0 [1, 2, 3, 4] 1"
  #         "1 [2, 3, 4] 3"
  
  numbers = [1, 2, 3, 4]
  numbers.each do |number|
    p number
    numbers.pop(1)
  end
  # outputs 1, 2, so does numbers.pop()
  
# Question 5
  # def factors(number)
  #   dividend = number
  #   divisors = []
  #   begin
  #     divisors << number / dividend if number % dividend == 0
  #     dividend -= 1
  #   end until dividend == 0
  #   divisors
  # end
  # refactor so 0 or negative numbers don't throw an exception
  
  def factors(number)
    dividend = number
    divisors = []
    while dividend > 0 do
      divisors << number / dividend if number % dividend == 0
      dividend -= 1
    end
    divisors
  end
  
# Question 6
  def rolling_buffer1(buffer, max_buffer_size, new_element)
    buffer << new_element
    buffer.shift if buffer.size >= max_buffer_size
    buffer
  end
  # modifies input buffer
  
  def rolling_buffer2(input_array, max_buffer_size, new_element)
    buffer = input_array + [new_element]
    buffer.shift if buffer.size >= max_buffer_size
    buffer
  end
  # does not modify input buffer
  
# Question 7
  # limit must be defined within the method
  def fib(first_num, second_num)
    limit = 15
    while second_num < limit
      sum = first_num + second_num
      first_num = second_num
      second_num = sum
    end
    sum
  end
  
  result = fib(0, 1)
  puts "result is #{result}"
  
# Question 8

  puts ("new york city").split.map { |word| word.capitalize }.join(' ')
  
  words = "new york city"
  capitalized_text = words.split.map { |word| word.capitalize }.join(' ')
  puts capitalized_text
  
# Question 9
  munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }
  
  munsters.each do |name, details|
    case details["age"]
    when 0...18
      details["age_group"] = "kid"
    when 18...65
      details["age_group"] = "adult"
    else
      details["age_group"] = "senior"
    end
  end
  
  puts munsters