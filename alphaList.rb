#Takes in an array of strings and returns the array in alphabetical order
#"a" has a lower value than "z"

=begin
parallel assignment
x = 1
y = 2
x, y = y, x
now x = 2 and y = 1
=end

#bubble alpha

def alphaList(list)
  swap = true
  while swap == true
    swap = false
    for i in 0..list.length - 2
      if list[i].downcase > list[i + 1].downcase
        list[i], list[i + 1] = list[i + 1], list[i]
        swap = true
      end
    end
  end
  return list
end

puts alphaList(["Bb", "c", "a", "d", "barney", "box"])