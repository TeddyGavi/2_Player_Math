class Question
  attr_reader :option, :select, :num1, :num2 
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @select = rand(0..3)
    @option = %i(+ - / *)
  end

  def current_q 
    "Question: What is #{num1} #{option[select]} #{num2}?"
  end

  def answer
    answer = num1.send(option[select], num2).round(2)
  end
  
end
