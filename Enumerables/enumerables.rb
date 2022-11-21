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
        new_arr = Array.new(self.length) {Array.new(args.length + 1)}
        arr_2d = [self, *args].map {|arr| arr.length}
        limit = arr_2d.max
        merged_arr = [self, *args]
        (0...limit).each do |idx1|   
            (0...limit).each do |idx2|
                if merged_arr[idx1][idx2] && new_arr[idx1][idx2] != nil
                    new_arr[idx1][idx2] = merged_arr[idx1][idx2] 
                end 

            end 
        end
    new_arr
    end 
end 


a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
[1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
[1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
[1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]





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

