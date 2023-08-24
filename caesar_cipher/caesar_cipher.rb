class Cipher
    def caesar_cipher(word,shift)
        alphabet = ('a'..'z').to_a
        encrypted_text = word.chars.map do |char|
            if  alphabet.include?(char.downcase)
                is_upper = char.upcase == char
                shifted_index = (alphabet.index(char.downcase) + shift) % 26
                shifted_char = alphabet[shifted_index]
                is_upper ? shifted_char.upcase : shifted_char
            else
                char
            end
        end.join
    end
end


