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
        new_arr = Array.new(self.length) 
        self.each do |ele|
            new_arr << self.merge
        end 

    end 

    


end 


arr_2 = [2, [3, 4], 5]
arr = [1, 2, 4]
# arr.my_each {|ele| p ele + 1}

# p arr.my_select {|ele|  ele if ele > 2}

# p arr.my_reject {|ele| ele > 2}

# p arr.my_any? {|ele| ele > 5} # false
# p arr.my_any? {|ele| ele > 3} # true

# p arr.my_all? {|ele| ele < 5} # true
# p arr.my_all? {|ele| ele > 3} # false

p arr_2.my_flatten

