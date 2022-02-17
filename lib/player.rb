class Player
  attr_reader :name, :position

  def initialize(stats)
    @name = stats[:name]
    @position = stats[:position]

  end
end
