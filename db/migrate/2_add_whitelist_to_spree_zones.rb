class AddWhitelistToSpreeZones < ActiveRecord::Migration
  def change
    add_column :spree_zones, :whitelist, :text
  end
end
