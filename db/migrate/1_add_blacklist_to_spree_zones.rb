class AddBlacklistToSpreeZones < ActiveRecord::Migration
  def change
    add_column :spree_zones, :blacklist, :text
  end
end
