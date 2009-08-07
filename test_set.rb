class TestSet
  # Constructs a new TestSet object with any number of arguments.
  def initialize(*args)
    @array = args.collect {|a| a.kind_of?(Numeric) ? a : a.to_f}
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
  
  # Returns the values in the set, partitioned into n subsets.
  # TestSet.new(1, 2, 3, 4, 5, 6).partition(2) => [[1, 2, 3], [4, 5, 6]]
  def partition(n)
    subset_size = (@array.size.to_f / n).ceil
    (0...n).collect {|i| @array[i * subset_size, subset_size]}
  end
end