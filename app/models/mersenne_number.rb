class MersenneNumber < ApplicationRecord
    validates :max_number, presence: true, uniqueness: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }
    validates :numbers, presence: true

    before_validation do 
        if self.max_number.is_a?(Numeric) && self.max_number < 1000 
            self.numbers = mersenne_upto(self.max_number).join(', ')
        end
    end

    private 

    def sieve_upto(n)
        s = (0..n).to_a
        s[0] = s[1] = nil
        s.each do |p|
          next unless p
          break if p**2 > n
    
          (p**2).step(n, p) { |m| s[m] = nil }
        end
        s.compact
    end
    
    def mersenne_upto(n)
        if n < 1
          return []
        end
    
        simples = sieve_upto(n)
        [1] + simples.select{|i| simples.include? 2**i - 1}.map {|i| 2**i - 1}
    end
end