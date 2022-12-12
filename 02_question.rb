class Question
  attr_reader :option, :select, :num1, :num2 
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @select = rand(0..3)
    @option = %i(+ - / *)
  end

  def ask
    "Question: What is #{num1} #{option[select]} #{num2}?"
  end

  def answer
    answer = num1.send(option[select], num2).round(2)
  end
  
  def correct?(input)
    if input == self.answer
      true
    else 
      false
    end
  end

end
