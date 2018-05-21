require 'pry'
class Triangle
  attr_accessor :side1, :side2, :side3, :sides

  def initialize side1, side2, side3
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @sides = []
    @sides.push(side1, side2, side3)
  end

  def check_zeroneg_errors
     @sides.any? {|side| side <= 0}
  end

  def check_ineq_error
    #side x + side y >= size z
    count = 0
    if @sides[0] + @sides[1] <= @sides[2]
      count += 1
    elsif @sides[1] + @sides[2] <= @sides[0]
      count += 1
    elsif @sides[0] + @sides[2] <= @sides[1]
      count+=1
    end 
    count
  end

  def kind
    if check_ineq_error > 0
      begin
        raise TriangleError
      # rescue TriangleError
      end
    end
    if check_zeroneg_errors
      begin
        raise TriangleError
      # rescue TriangleError
      end
    end

    check_triangle_kind = @sides.map do |side|
      "#{side}: #{@sides.count(side)}"
    end.uniq.length
# binding.pry
    case check_triangle_kind
    when 3
      :scalene
    when 2
      :isosceles
    when 1
      :equilateral
    else
    end

  end

  class TriangleError < StandardError
    def zero_message
      "One or more sides has a value of 0 or less, you cannot create a triangle like that."
    end
    # side1 + side2 > side3 || side2 + side3 > side1 || side1 + side3 > side2
    # side1 > 0 && side2 > 0 && side3 > 0
  end
# binding.pry
end
