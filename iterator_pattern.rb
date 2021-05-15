class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def has_next?
    @index < @array.length
  end

  def item
    @array[@index]
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

array = ['red', 'green', 'blue']
i = ArrayIterator.new(array)
while i.has_next?
  pp "item: #{i.next_item}"
end

i = ArrayIterator.new('abc')
while i.has_next?
  pp "item: #{i.next_item}"
end

def for_each_element(array)
  i = 0
  while i < array.length
    yield(array[i])
    i += 1
  end
end

a = [10, 20, 30]
for_each_element(a) {|element| pp "The element is #{element}" }
a.each {|element| pp "The element is #{element}" }