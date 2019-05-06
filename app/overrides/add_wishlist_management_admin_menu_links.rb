Deface::Override.new(
  virtual_path:  'spree/layouts/admin',
  name:          'add_wishlist_management_main_menu_tabs',
  insert_bottom: '#main-sidebar',
  partial: 'spree/admin/shared/wishlist_management_tab'
)
