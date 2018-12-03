# Player info
class Player
  attr_reader :name
  attr_accessor :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lost_live
    @lives -= 1
  end

  def status
    "#{name} #{lives}/3 lives"
  end

  def dead?
    @lives.zero?
  end
end
