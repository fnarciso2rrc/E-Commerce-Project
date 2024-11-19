ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :product_name, :category_id, :brand, :price, :ranking, :ingredients
  #
  # or
  #
  # permit_params do
  #   permitted = [:product_name, :brand, :price, :ranking, :ingredients, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  

end
