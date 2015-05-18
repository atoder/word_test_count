require_relative 'lib/word_sequence.rb'

file_name = ARGV[0].to_s

if file_name.nil? || file_name.empty?
  #if empty, use default sample.txt
  file_name = "sample.txt"
end

exit()

word_sequence = WordSequence.new

# Step 1 - Read the file and get array of all words
word_sequence.read_file_and_generate_words(file_name)

# Step 2 - Create sequences for each word
word_sequence.generate_sequence

# Step 3 - Sort and get rid of non uniques
word_sequence.sort_and_get_uniques

# Step 4 - Write to sequence and word file
word_sequence.write_to_files

