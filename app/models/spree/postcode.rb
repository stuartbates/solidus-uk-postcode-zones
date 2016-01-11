module Spree
  class Postcode

    def initialize(postcode)
      @postcode = sanitise_input(postcode)
    end

    def outward_code
      @postcode[ 0, @postcode.length-3 ]
    end

    def outward_letters
      outward_code.gsub( /[^a-zA-Z]/, '' )
    end

    def outward_numbers
      outward_code.gsub( /[a-zA-Z]/, '' )
    end

    def to_s
      @postcode.to_s
    end

    private

    def sanitise_input(postcode)
      postcode.gsub(/[[:space:]]+/, '').upcase
    end

  end
end
