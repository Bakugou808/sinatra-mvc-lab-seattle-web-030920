class PigLatinizer



  def piglatinize(input_str)
    input_str.split(" ").length == 1 ? piglatinize_word(input_str) : piglatinize_sentence(input_str)
  end

  private

  def consonant?(char)
    !char.match(/[aAeEiIoOuU]/)
  end

  def piglatinize_word(word)
    # word starts with vowel
    if !consonant?(word[0])
      word = word + "w"
    # word starts with 3 consonants
    elsif consonant?(word[0]) && consonant?(word[1]) && consonant?(word[2])
      word = word.slice(3..-1) + word.slice(0,3)
    # word starts with 2 consonants
    elsif consonant?(word[0]) && consonant?(word[1])
      word = word.slice(2..-1) + word.slice(0,2)
    # word starts with 1 consonant
    else
      word = word.slice(1..-1) + word.slice(0)
    end
    word << "ay"
  end

  def piglatinize_sentence(sentence)
    sentence.split.collect { |word| piglatinize_word(word) }.join(" ")
  end


    # def piglatinize(input_str)
    #     words_array = input_str.split(' ')
    #     vowels = "aeiouAEIOU"
    #     consonants = "zxcvbnmlkjhgfdsqwrtpZXCVBNMSDFGHJKLQWRTYP"
    #     piggy1 = "ay"
    #     piggy2 = "way"

    #     translated = words_array.map{|word| 
             
    #         if vowels.include?(word[0])
    #             pigged = word+piggy2 
    #         elsif consonants.include?(word[0])  
    #             pigged = word[1..-1]+word[0]+piggy1 
    #         elsif consonants.include?(word[0]) && consonants.include?(word[1])
    #             pigged = word[2..-1]+word[0..1]+piggy1 
    #         elsif consonants.include?(word[0]) && consonants.include?(word[1]) && consonants.include?(word[2])
    #             pigged = word[3..-1]+word[0..2]+piggy1 
    #         end 
    #     }.join(' ')

    #     translated

    # end 

end 