class TestSet
  # Constructs a new TestSet object with any number of arguments.
  def initialize(*args)
    @array = args
  end
  
  # Returns the average of all the elements in the set.
  def average
    @array.inject(0.0) {|total, n| total + n} / @array.size
  end
end
