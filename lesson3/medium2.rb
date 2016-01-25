# Question 1

  munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" }
  }
  
  # create a var to hold male ages
  # for each item in the munsters hash
  # check if male or female
  # if male, get age and put in male_ages var
  # for each additional male, add his age to male_ages
  
  male_ages = 0                       # can't put empty quotes here because that would indicate a string
  munsters.each do |name, details|    # since the value is a hash, give it a name
    if details["gender"] == "male"    # tell the computer to look in the details hash for gender
      male_ages += details["age"]
    end
  end
  
  puts male_ages
  
# Question 2

  munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }
  
  munsters.each do |name, details|
    puts "#{name} is a #{details['age']} year old #{details['gender']}."
  end
  
# Question 3

  def tricky_method(a_string_param, an_array_param)
    a_string_param += "rutabaga"  # does not mutate caller
    an_array_param << "rutabaga"  # mutates caller 
  end
  
  my_string = "pumpkins"
  my_array = ["pumpkins"]
  tricky_method(my_string, my_array)
  
  puts "My string looks like this now: #{my_string}"  # returns pumpkins
  puts "My array looks like this now: #{my_array}"    # returns ["pumpkins", "rutabaga"]
  puts "-----"
  
  def not_so_tricky_method(a_string_param, an_array_param)
    a_string_param += "rutabaga"
    an_array_param += ["rutabaga"]
    return a_string_param, an_array_param   # this allows it to return 2 variables instead of 1
  end
  
  my_string = "pumpkins"
  my_array = ["pumpkins"]
  my_string, my_array = not_so_tricky_method(my_string, my_array) # have to do this in order to interpolate strings
  
  puts "My string looks like this now: #{my_string}"
  puts "My array looks like this now: #{my_array}"
  
  # puts not_so_tricky_method(my_string, my_array) 
  # this works if my_string and my_array aren't assigned in line 62
  
# Question 4

  sentence = "Humpty Dumpty sat on a wall."
  
  # puts sentence.split.reverse.join(" ")
  # This solution leaves period after wall.
  
  puts sentence.split(/\W/).reverse.join(' ') + "."
  # The (/\W/) tells it to split on a non-word character, so the period isn't kept. See Ruby Regexp class
  
# Question 5
  
  answer = 42
  
  def mess_with_it(some_number)
    some_number += 8
  end
  
  new_answer = mess_with_it(answer)
  
  p answer - 8
  
  # outputs 34 because answer is not modified by caller
  # output of new_answer would be 50
  
# Question 6

  munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }
  
  def mess_with_demographics(demo_hash)
    demo_hash.values.each do |family_member|
      family_member["age"] += 42
      family_member["gender"] = "other"
    end
  end
  
  mess_with_demographics(munsters)
  puts munsters
  # since the output isn't assigned to a new variable, the munsters hash is modified
  
# Question 7

  def rps(fist1, fist2)
    if fist1 == "rock"
      (fist2 == "paper") ? "paper" : "rock"
    elsif fist1 == "paper"
      (fist2 == "scissors") ? "scissors" : "paper"
    else
      (fist2 == "rock") ? "rock" : "scissors"
    end
  end
  
  puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
  # innermost rps outputs paper, rock
  # next rps outputs paper
  # outermost rps outputs paper
  
# Question 8

  def foo(param = "no")
    "yes"
  end
  # foo outputs yes
  
  def bar(param = "no")
    param == "no" ? "yes" : "no"
  end
  # bar returns yes if no is entered, no if yes is entered
  
  puts bar(foo) # puts no
  
  