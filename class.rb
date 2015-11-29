def numbers 
 sum = 0
    [1,2,3,4,5].each do |value|
      sum += value
    end
  print sum 
  end
  
 def numbers 
 sum = 0
    [1,2,3,4,5].each { |value| sum += value} 
  print sum 
  end