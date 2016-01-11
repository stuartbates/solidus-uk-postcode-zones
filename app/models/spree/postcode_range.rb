module Spree
  class PostcodeRange

    def initialize(range)
      @range = range
    end

    def include?(postcode)
      lower_bound, upper_bound = calculate_range_bounds(range_numbers)
      range = Range.new( lower_bound, upper_bound )
      postcode.outward_letters == range_letters && range.include?(postcode.outward_numbers)
    end

    def range_letters
      @range.gsub(/[^a-zA-Z]/, '')
    end

    def range_numbers
      @range.gsub(/[a-zA-Z]/, '')
    end

    def calculate_range_bounds(range_numbers)
      lower_bound, upper_bound = range_numbers.split('-')
      upper_bound ||= lower_bound
      [lower_bound, upper_bound]
    end

  end
end
