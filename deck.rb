class Deck
  # attr_reader :collection
  def initialize
    @collection = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @collection << Card.new(value, suit)
      end
    end

  @collection.shuffle!
  end

  def draw!
    @collection.pop
  end

  def collection
    @collection
  end
end
