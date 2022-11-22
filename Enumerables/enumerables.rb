require "byebug"

class Array 

    def my_each(&blk)
        i = 0
        while i < self.length 
            blk.call(self[i])
            i += 1 
        end 
        self
    end 


    def my_select(&blk)
        new_arr = []
        self.my_each do |ele|

            new_arr << blk.call(ele) if blk.call(ele)

        end

        return new_arr
    end 


    def my_reject(&blk)
        new_arr = []

        (0...self.length).each do |idx|

            new_arr << self[idx] if !blk.call(self[idx])

        end
        new_arr

    end 

    def my_any?(&blk)

        (0...self.length).each do |idx|

            return true if blk.call(self[idx])

        end
        false
    end

    def my_all?(&blk)

        (0...self.length).each do |idx|

            return false if !blk.call(self[idx])

        end
        true
    end


    def my_flatten
        new_arr = []
        self.each do |ele|
            if ele.is_a?(Array)
                new_arr.concat(ele.my_flatten)
            else  
                new_arr << ele 
            end 
        end 
    new_arr
    end 


    def my_zip(*args)
        
        new_arr = Array.new

        self.length.times {|i|
    
            temp_arr = [self[i]]

            args.each {|arr| temp_arr << arr[i]}

            new_arr << temp_arr

        }

        new_arr

    end 

    def my_rotate(n=1)

       if n > 0
        
            n.times {self.push(self.shift)}
            return self

        elsif n < 0

            positive_n = n * -1
            positive_n.times {self.unshift(self.pop)}
            return self
            
        else
            return self    
       end
    end


end


# my_rotate tests (test 1 at a time for accurate results)
#-----------------------------------

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# #my_zip tests
#-----------------------------------

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

#-----------------------------------
# Anything above my_zip; test cases

# arr_2 = [2, [3, 4], 5]
# arr = [1, 2, 4]
# arr.my_each {|ele| p ele + 1}

# p arr.my_select {|ele|  ele if ele > 2}

# p arr.my_reject {|ele| ele > 2}

# p arr.my_any? {|ele| ele > 5} # false
# p arr.my_any? {|ele| ele > 3} # true

# p arr.my_all? {|ele| ele < 5} # true
# p arr.my_all? {|ele| ele > 3} # false

# p arr_2.my_flatten

#------------------------------------