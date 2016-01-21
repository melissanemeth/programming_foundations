# Ask the user for two numbers
# Ask the user which operation they'd like to perform
# Perform the operation
# Output the result

def prompt(message)
  puts "#{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def operation_to_message(op)
  word =  case op
          when '1'
            'Adding...'
          when '2'
            'Subtracting...'
          when '3'
            'Multiplying...'
          when '4'
            'Dividing...'
          end
  word
end

prompt "Welcome to Calculator! Please enter your name."

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt "Please enter a valid name."
  else
    break
  end
end

prompt "Hi, #{name}!"

loop do
  number1 = ''
  loop do
    prompt "Please enter your first number."
    number1 = gets.chomp

    if integer?(number1)
      break
    else
      prompt "That doesn't look like a valid number, please enter another."
    end
  end

  number2 = ''
  loop do
    prompt "Please enter your second number."
    number2 = gets.chomp

    if integer?(number2)
      break
    else
      prompt "That doesn't look like a valid number, please enter another."
    end
  end

  operator_prompt = <<-MSG
    Which operation would you like to perform?
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG

  prompt operator_prompt

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt "Please enter 1, 2, 3, or 4."
    end
  end

  prompt "#{operation_to_message(operator)}"

  result =  
    case operator
    when '1'
      result = number1.to_i + number2.to_i
    when '2'
      result = number1.to_i - number2.to_i
    when '3'
      result = number1.to_i * number2.to_i
    when '4'
      result = number1.to_f / number2.to_f
    end

  puts "The answer is #{result}."

  prompt "Do you want to perform another calculation? (Y to calculate again.)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for using Calculator!"
