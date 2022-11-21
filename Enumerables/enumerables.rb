class Array 

    def my_each(&blk)
        i = 0
        while i < self.length 
            blk.call(self[i])
            i += 1 
        end 
    end 


    def my_select(&blk)
        new_arr = []
        new_arr << self.my_each(&blk)
        return new_arr
    end 


    def my_reject(&blk)
        new_arr = []
    end 

end 



arr = [1, 2, 4]
# arr.my_each {|ele| p ele + 1}

p arr.my_select {|ele|  ele if ele > 2}