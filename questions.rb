# Questions class
class Newquestion
  attr_reader :num1, :num2

  def initialize
    @num1 = rand(1...20)
    @num2 = rand(1...20)
    @sum = @num1 + @num2
  end

  def generate_question
    "What does #{@num1} plus #{@num2} equal?"
  end

  def check_answer(user_answer)
    @sum == user_answer
  end
end
