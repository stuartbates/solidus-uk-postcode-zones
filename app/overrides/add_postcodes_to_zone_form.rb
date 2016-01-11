Deface::Override.new(
    virtual_path: 'spree/admin/zones/new',
    name: 'add_postcodes_to_zone_new',
    insert_before: 'div.clear',
    partial: 'spree/admin/zones/postcode_fields',
    disabled: false
)

Deface::Override.new(
    virtual_path: 'spree/admin/zones/edit',
    name: 'add_postcodes_to_zone_edit',
    insert_before: 'div.clear',
    partial: 'spree/admin/zones/postcode_fields',
    disabled: false
)
