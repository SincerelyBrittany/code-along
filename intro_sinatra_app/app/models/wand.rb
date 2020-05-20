class Wands < ActiveRecord::Base

  def to_s
      "#{self.wood}, #{self.length}, #{self.core}"
  end
end
