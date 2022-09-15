require "diary_entry"

RSpec.describe DiaryEntry do
  describe '#count_words' do
    it 'Returns word count' do
      first_entry = DiaryEntry.new("count_words", '1 space 2 space 3 space')
      expect(first_entry.count_words).to eq 6
    end
  end

  describe "#reading_time" do
    it 'calculates time taken to read contents' do
      first_entry = DiaryEntry.new("count_words", '1 space 2 space 3 space')
      expect(first_entry.reading_time(200)).to eq 1
    end
  end

  describe '#reading_chunk' do
    it 'returns full contents' do
      first_entry = DiaryEntry.new("count_words", '1 space 2 space 3 space')
      expect(first_entry.reading_chunk(200, 1)).to eq '1 space 2 space 3 space'
    end

    it 'returns a chunk of text' do
      first_entry = DiaryEntry.new("count_words", '1 space 2 space 3 space')
      expect(first_entry.reading_chunk(2, 1)).to eq "1 space"
    end

    it 'returns second chunk after first' do
      first_entry = DiaryEntry.new("count_words", '1 space 2 space 3 space')
      first_entry.reading_chunk(2, 1)
      expect(first_entry.reading_chunk(2, 1)).to eq '2 space'
    end

    it 'returns third chunk after second' do
      first_entry = DiaryEntry.new("count_words", '1 space 2 space 3 space')
      first_entry.reading_chunk(2, 1)
      first_entry.reading_chunk(2, 1)      
      expect(first_entry.reading_chunk(2, 1)).to eq '3 space'
    end

    it 'loops around once we reach end of text' do
      first_entry = DiaryEntry.new("count_words", '1 space 2 space 3 space')
      first_entry.reading_chunk(2, 1)
      first_entry.reading_chunk(3, 1)      
      first_entry.reading_chunk(2, 1)
      expect(first_entry.reading_chunk(2, 1)).to eq '1 space'
    end

    it 'it returns second chunk of second loop' do
      first_entry = DiaryEntry.new("count_words", '1 space 2 space 3 space')
      first_entry.reading_chunk(2, 1)
      first_entry.reading_chunk(3, 1)      
      first_entry.reading_chunk(2, 1)
      first_entry.reading_chunk(2, 1)
      expect(first_entry.reading_chunk(2, 1)).to eq '2 space'
    end
    
  end
end