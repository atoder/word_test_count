require './word_sequence.rb'


word_sequence = WordSequence.new

# Step 1 - Read the file and get array of all words
word_sequence.read_file_and_generate_words

# Step 2 - Create sequences for each word
word_sequence.generate_sequence

# Step 3 - Sort and get rid of non uniques
word_sequence.sort_and_get_uniques

# Step 4 - Write to sequence and word file
word_sequence.write_to_files

