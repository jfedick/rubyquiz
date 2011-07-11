
def split_the_message(message)
  split_message=""
  count = 0
  total_length = message.gsub(/[^[:alpha:]]/, '').length
  message.gsub(/[^[:alpha:]]/, '').upcase.chars.each do |x|
    if (count+1) % 5 == 0
      split_message.concat "#{x} "
    else
      split_message.concat x
    end
    count+=1
  end
  
  filler_amount = 5 - total_length % 5
  if filler_amount != 5
    split_message.concat "X" * filler_amount  
  end
  return split_message
end

def keystream
  return "DWJXH YRFDG TMSHP UURXJ"
end

def convert_letters_to_numbers(split_message)
  string_of_numbers = ""
  split_message.chars.each do |x|
    unless x.ord == 32
      string_of_numbers.concat((x.ord - 64).to_s + " ")
    end
  end
  return string_of_numbers
end

def convert_numbers_to_letters(numbers_array)
  string_of_letters = ""
  numbers_array.each do |x|
    string_of_letters.concat (x+64).chr
  end
  return string_of_letters
end

def add_the_message_numbers(first_message, second_message)
  converted_numbers= Array.new
  count = 0
  first_message.split.zip(second_message.split).map do |pair| 
    sum = pair[0].to_i + pair[1].to_i 
    if sum > 26
      sum -= 26
      converted_numbers[count]= sum 
      count += 1
    else
      converted_numbers[count]= sum  
      count += 1
    end
  end
  return converted_numbers
end

message = "Code in Ruby, live longer!"

step_1 = split_the_message message
step_2 = keystream
step_3 = convert_letters_to_numbers step_1
step_4 = convert_letters_to_numbers step_2
step_5 = add_the_message_numbers step_3, step_4
step_6 = convert_numbers_to_letters step_5
