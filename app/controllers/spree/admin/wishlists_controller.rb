class Spree::Admin::WishlistsController < Spree::Admin::BaseController

  def copy_wishlists
    target_user_id = Spree::User.find_by_email(params[:copy_to]).id

    user = Spree::User.find_by_email(params[:copy_from])

    wishlists = user.wishlists

    wishlists.each do |wishlist|
      new_wishlist = Spree::Wishlist.find_or_create_by(user_id: target_user_id, name: wishlist.name)
      wishlist.wished_products.each do |product|
        Spree::WishedProduct.find_or_create_by(variant_id: product.variant_id, wishlist_id: new_wishlist.id)
      end
    end
    redirect_back(fallback_location: root_path)
  end
end
