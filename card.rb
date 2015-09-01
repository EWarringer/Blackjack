class Card
  attr_reader :rank, :suit
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def card
    "#{@rank}#{@suit}"
  end
end
