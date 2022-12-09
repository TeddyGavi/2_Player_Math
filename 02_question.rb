class Question
  attr_reader :option, :select, :num1, :num2 
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @select = rand(0..3)
    @option = %i(+ - / *)
  end

  def print_question
    answer = @num1.send(option[select], @num2).round(2)
    puts "Question: What is #{self.num1} #{self.option[self.select]} #{self.num2}?"
    answer
  end

  def answer?(input)
    input = gets.chomp

    if input == answer
      true
    else
      false      
    end

  end
  
  
end
q = Question.new
p q.option
p q.select
q.print_question