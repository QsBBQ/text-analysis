# This is the base code for v0.1 of our Ruby text analyzer.
# Visit https://github.com/codeunion/text-analysis/wiki to see what to do.
#
# Send an email to your cohort mailing list if you have any questions
# or you're stuck!  These comments are here to help you, but please delete them
# as you go along. You wouldn't normally have such heavily-commented code.

# Method name: item_counts
# Input:   An arbitrary array
#
# Returns: A hash where every item is a key whose value is the number of times
#          that item appears in the array
#
# Prints:  Nothing

# Here are some examples:
#     item_counts(["I", "am", "Sam", "I", "am"])
#       # => {"I" => 2, "am" => 2, "Sam" => 1}
#
#     item_counts([10, 20, 10, 20, 20])
#       # => {10 => 2, 20 => 3}
#
# In short, item_counts(array) tells us how many times each item appears
# in the input array.

def item_counts(words_array)
  #counts = {} # Initialize counts to an empty Hash
  counts = Hash.new(0)  #This sets the the value to zero
  #This counts the letters ot words from the array and creates a key value hash
  words_array.each do |item|
    counts[item] += 1
  end
  return counts # This returns the "counts" hash
end

def string_split(string)
  #Might get rid of this method.
  string = sanitize(string)
  string_split = string.split("")
  return string_split
end

def words_array(words)
  #thinking of changing this method name.
  #letter_sanitized = string.downcase.scan(/[a-z]/)  #trying scan
  words_array = words.downcase.scan(/\w+/)  #trying scan
  return words_array  #Returns words as an array. Not sure if I still need letters.
end

def read_file(filename)
  #This method reads the file
  file_contents = File.read(filename)
  return file_contents
end

def freq_stat(words_hash)
  total_words = 0.0
  percent_hash = Hash.new(0)
  words_hash.each do |word, frequency|
    total_words += frequency
  end
  words_hash.each do |word, frequency|
    percent_hash[word] = '%.2f' % [((frequency/total_words)*100).round(2)]
  end
  return percent_hash
end

def histogram(words_percentage)
  #Filler character
  sym = "="
  #Iterate over the hash and print the word and percent to the screen.
  #The word frequency appears a lot smaller might adjust bucket for filler.
  words_percentage.each do |word, percent|
    num_sym = sym * (percent * 10).to_i
    puts "#{word} [ #{percent}%]   #{num_sym}"
  end
end

def prints_data()
  #struggling a bit with what to name things is there a practice or rule to try and follow?
  #I was a little confused how to handle words and letters or if that was needed.
  if ARGV.size == 0
    puts "Input a filename!. Try again!"
    puts "ruby textalyze.rb yourfile.txt"
  end
  #Read file specified in ARGV as a sting
  file_contents = read_file(ARGV[0])
  #arry = string_split(file_contents)
  #normalizes words and creates an array of words
  words_array = words_array(file_contents)
  #Counts the array of words and finds the frequency percentage that the word is used.
  words_percentage = freq_stat(item_counts(words_array))
  #Calls the histogram method and prints the output with a filler character
  print_histogram = histogram(words_percentage)
end

prints_data
#p histogram({"a" => 0.25, "p" => 0.25, "l" => 0.25, "e" => 0.25})
#p freq_stat({"a" => 2, "p" => 2, "l" => 2, "e" => 2}) == {"a" => 0.25, "p" => 0.25, "l" => 0.25, "e" => 0.25}
#p prints_data("aAPplLeE") == {"a" => 2, "p" => 2, "l" => 2, "e" => 2}

# "p" prints something to the screen in a way that's friendlier
# for debugging purposes than print or puts.

# p item_counts([1,2,1,2,1]) == {1 => 3, 2 => 2}
# p item_counts(["a","b","a","b","a","ZZZ"]) == {"a" => 3, "b" => 2, "ZZZ" => 1}
# p item_counts([]) == {}
# p item_counts(["hi", "hi", "hi"]) == {"hi" => 3}
# p item_counts([true, nil, "dinosaur"]) == {true => 1, nil => 1, "dinosaur" => 1}
# p item_counts(["a","a","A","A"]) == {"a" => 2, "A" => 2}
# p string_split("apple") == {"a" => 1, "p" => 2, "l" => 1, "e" => 1}
# p string_split("shark's") == {"s" => 2, "h" => 1, "a" => 1, "r" => 1, "k" => 1, "'" => 1}
# p string_split("aAPplLeE") == {"a" => 2, "p" => 2, "l" => 2, "e" => 2}

#p read_file("sample_data/great-gatsby.txt")
#p prints_data



# Each of the lines above will print out "true" or "false" and collectively
# act as a sanity check.  Remember that conceptually "x == y"
# means "are x and y equal?"
#
# That is, when you run the code, if any lines print out "false"
# then you know something is off in your code.
#
# This does *not* mean that your code is perfect if each line
# prints out "true.""  For example,
#   1. We might have missed a corner case
#   2. The code does what it should, but is conceptually confused
#   3. Something else we haven't though of
#
# Remember: Option #3 is *always* possible.
#
# Think of these like rumble strips on the side of the road.  They're here
# to tell you when you're veering off the road, not to guarantee you're
# driving phenomenally. :)
