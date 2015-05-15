require 'minitest/autorun'
require './word_sequence.rb'

#class TestWordSequence < MiniTest::Test

describe WordSequence, "Word Sequence Challenge"  do

  let(:ws) { WordSequence.new }

  describe "when asked to read a default sample.txt file" do
    let(:words_arr) {  ws.read_file_and_generate_words }
    it "has populated the words array with all the words more characters than 3" do
      print words_arr
      words_arr.size.must_equal 3
    end
    it "still the same" do
    end
  end

end
