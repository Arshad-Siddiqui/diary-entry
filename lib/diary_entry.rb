class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @words_read = 0
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split(' ').length
  end

  def reading_time(wpm)
    (count_words.to_f / wpm).ceil
  end

  def reading_chunk(wpm, minutes)
    if @words_read >= count_words then @words_read = 0 end
    amount_of_words_to_return = wpm * minutes
    words = @contents.split(' ')
    return_this = words[(@words_read)...(amount_of_words_to_return + @words_read)].join(' ')
    @words_read += amount_of_words_to_return
    return_this
  end
end

first_entry = DiaryEntry.new("count_words", '1 space 2 space 3 space')
p first_entry.reading_chunk(2, 1)
p first_entry.reading_chunk(2, 1)