class TestSet
  # Constructs a new TestSet object with any number of arguments.
  def initialize(*args)
    @array = args
  end
  
  # Returns the average of all the elements in the set.
  def average
    @array.inject(0.0) {|total, n| total + n} / @array.size
  end
  
  # Returns the median of all the elements in the set (that is, the middle value
  # if there are an odd number of elements, or the average of the two middle values if even)
  def median
    sorted = @array.sort
    middle = ((@array.size + 1.0) / 2) - 1 # subscript of middle element of array, with .5 if there are two middle values
    if middle.floor == middle # middle is an integer
      sorted[middle]
    else
      (sorted[middle.floor] + sorted[middle.ceil]) / 2.0
    end
  end
end
