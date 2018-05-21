require 'pry'
class Triangle
  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
  end

  def kind
    sides = [@length1, @length2, @length3].sort {|l1, l2| l1 <=> l2}

    if (sides[0] + sides[1] <= sides[2]) || sides[0] <= 0
      begin
        raise TriangleError
      end
    elsif sides[0] == sides[2]
      return :equilateral
    elsif (sides[0] == sides[1] || sides[1] == sides[2]) &&  sides[0] != sides[2]
      return :isosceles
    else
      return :scalene
    end
  end
end

class TriangleError < StandardError
  def message
    "This is not a triangle."
  end
end
