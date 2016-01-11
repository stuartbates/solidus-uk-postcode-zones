Spree::Zone.class_eval do

  def include_with_postcodes?(address)
    if matched = include_without_postcodes?(address)
      if postcode_filter_required?
        matched = postcode_matches?(postcode_ranges, address.zipcode)
      end
    end
    blacklisted?? !matched : matched
  end
  alias_method_chain :include?, :postcodes

  protected

  def postcode_filter_required?
    blacklist.present? || whitelist.present?
  end

  def postcode_matches?(ranges, needle)
    ranges.any? do |range|
      postcode = Spree::Postcode.new(needle)
      Spree::PostcodeRange.new(range).include?(postcode)
    end
  end

  def blacklisted?
    !!blacklist
  end

  def postcode_ranges
    list = blacklisted?? blacklist : whitelist
    process_postcode_list(list)
  end

  def process_postcode_list(postcode_list)
    postcode_list.split(',').map(&:strip).map(&:upcase)
  end

end
