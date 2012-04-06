3.times { print "Ruby!"}
1.upto(9) { |x|  print x}

a =[1,2,3]
a.each do |elt|
  print "\n"
  print elt 
end

b = [1,2,3,4]

c = b.map { |e| e*e }

print "\n" 
c.each do |e|
  print e
  print " "
end
print "\n" 

d = c.select {|x| x > 10}
d.each do |e|
  print e
  print " "
end
print "\n" 

print "array inject demo"
sum = 0
sum = a.inject {|sum, x| sum + x} 

print sum
