class WordSequence
  attr_accessor :seq_hash
  attr_accessor :words_arr

  def initialize(sequence_num = 4)
    @words_arr = []
    @seq_hash = {}
    @sequence_num = sequence_num
  end

  # This method will read the file and generate array of all words
  def read_file_and_generate_words(file_to_read)
    begin
       # only save words which are bigger than our sequence
      File.open(file_to_read).readlines.each { |line| @words_arr << line.chomp if line.length >= @sequence_num }
    rescue => err
      puts "Exception: #{err}"
    end
  end

  # generates a hash with each word and all it's sequences
  def generate_sequence
    @words_arr.each do |word|
      # generates sequences of every word
      #splits a word by each character
      letter_arr = word.split(//)
      letter_arr.each_cons(@sequence_num) do |seq|
        (@seq_hash[seq.join] ||= []) << word
      end
    end
  end

  # sort based on sequence and get rid of non uniques
  def sort_and_get_uniques
    @seq_hash = @seq_hash.sort.to_h
    @seq_hash = @seq_hash.select {|seq, word| word.count == 1}
    puts 
  end

  def write_to_files(sequence_file = "sequences.txt", words_file = "words.txt")
    sequence_file = File.open(sequence_file, 'w')
    words_file = File.open(words_file, 'w')
    @seq_hash.each do |seq, word|
      sequence_file.puts(seq)
      words_file.puts(word)
    end
    sequence_file.close
    words_file.close
  end

end
