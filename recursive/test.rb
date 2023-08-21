def factorial(input)
    input == 1 ? 1 : input * factorial(input - 1)
end

puts factorial(5)

def is_palindrome?(string)
    return true if string.length == 1 ||  string.length == 0

    is_palindrome?(string[1..-2]) if string[0] == string[-1]
end

puts is_palindrome?("121")

def bottles_on_the_wall(n)
    return  "no more bottles of beer on the wall" if n == 0 

    puts "#{n} bottles of beer on the wall"

    bottles_on_the_wall(n - 1)
end

puts bottles_on_the_wall(5)

def fib(n)
    if n == 0
        0
    elsif n == 1
        1
    else
        fib(n-1) + fib(n-2)
    end
end

puts fib(6)

def flatten(nested_array)
    array = []
    nested_array.each do |element|
      if element.is_a?(Array)
        array.concat(self.flatten(element))
      elsif not element.nil?
        array << element
      end
    end
    array
end

puts flatten([[1, [8, 9]], [3, 4]]).to_s

def roman_numeral(number,result = "")
    roman_mapping = {
        1000 => "M",
        900 => "CM",
        500 => "D",
        400 => "CD",
        100 => "C",
        90 => "XC",
        50 => "L",
        40 => "XL",
        10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I"
      }
    return result if number == 0

    roman_mapping.keys.each do |divisor|
        quotient, modulus = number.divmod(divisor)
        result << roman_mapping[divisor] * quotient
        return roman_numeral(modulus, result) if quotient > 0
    end
end

puts roman_numeral(1995)

def roman_numeral_to_int(roman,result = 0)
    roman_mapping = {
        1000 => "M",
        900 => "CM",
        500 => "D",
        400 => "CD",
        100 => "C",
        90 => "XC",
        50 => "L",
        40 => "XL",
        10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I"
      }
    return result if roman.empty?

    roman_mapping.values.each do |letter|
        if roman.start_with?(letter)
            result += roman_mapping.key(letter)
            roman.slice!(letter)
            return roman_numeral_to_int(roman,result)
        end
    end
end

puts roman_numeral_to_int('MCMXCV')

    


