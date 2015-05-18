require 'minitest/autorun'
require_relative '../lib/word_sequence.rb'

# Sample Tests
#
describe WordSequence, "Word Sequence Challenge"  do

  describe "when asked to read a default sample.txt file" do
    ws = WordSequence.new
    ws.read_file_and_generate_words('sample.txt')
    ws.generate_sequence

    it "has populated the words array with all the words that fit our default sequence" do
      ws.words_arr.count.must_equal 3
    end

    it "gets rid of all non uniques" do
      ws.sort_and_get_uniques
      ws.seq_hash.count.must_equal 6
    end

    it "has created the sequence and words files" do
      ws.sort_and_get_uniques
      ws.write_to_files
      File.exist?("sequences.txt").wont_equal false
      File.exist?("words.txt").wont_equal false
    end
  end

  describe "when asked to generate sequence for 'hello' and 'ello'" do

    ws = WordSequence.new
    ws.generate_sequence
    ws.words_arr << "hello"
    ws.words_arr << "ello"
    ws.generate_sequence

    it "has created 2 sequences" do
      ws.seq_hash.count.must_equal 2
    end
    
    it "has created unique sequences" do
      ws.sort_and_get_uniques
      ws.seq_hash.count.must_equal 1
    end
  end

end
