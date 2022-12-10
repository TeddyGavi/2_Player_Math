class Question
  attr_reader :option, :select, :num1, :num2 
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @select = rand(0..3)
    @option = %i(+ - / *)
  end

def ask_question? 
    answer = num1.send(option[select], num2).round(2)
    puts "Question: What is #{num1} #{option[select]} #{num2}?"
 
    input = gets.chomp.to_i

    if input == answer
      puts "You are correct! the answer was: #{answer}!"
       true
    else
      puts "Sorry wrong answer, the answer was: #{answer}"
      false      
    end

  end
  
end
