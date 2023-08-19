def substrings (word,dictionary)
    result_hash = Hash.new(0)

    array = word.downcase.split

    dictionary.each do |substring|
        substring.downcase!
        count = word.scan(substring).length
        result_hash[substring] = count if count > 0
    end

    result_hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("Howdy partner, sit down! How's it going?", dictionary) 