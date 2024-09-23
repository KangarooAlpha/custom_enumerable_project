module Enumerable
  # Your code goes here
  
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each do |elem|
      yield elem
    end
  end

  def my_each_with_index
    ind = 0
    my_each do |elem| 
      yield elem,ind
      ind+=1
    end
  end

  def my_select
    arr = []
    my_each {|elem| arr << elem if yield(elem)}
    arr
  end

  def my_all?
    ver = true
    my_each {|elem|ver = false unless yield(elem)}
    ver
  end

  def my_any?
    ver = false
    my_each {|elem|ver = true if yield(elem)}
    ver
  end

  def my_none?
    ver = true
    my_each {|elem|ver = false if yield(elem)}
    ver
  end

  def my_count
    if block_given?
      c = 0
      my_each {|elem| c+=1 if yield(elem)}
      c
    else
      self.length
    end
  end
  def my_map
    if block_given?
      arr = []
      my_each {|elem| arr << yield(elem) }
      arr
    else
      self
    end
  end
  def my_inject(ini=self.first)
    my_each{|elem| ini = yield(ini, elem)}
    ini
  end
end
