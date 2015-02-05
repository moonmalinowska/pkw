ActiveAdmin.register User do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
 # menu :label => I18n.t(:Users)
  permit_params :login, :password, :password_confirmation, :role

  actions :all, :change_role
  index do
    selectable_column
    id_column
    column :login

    column :role, :as => :check_boxes
    column :created_at
    actions defaults: true do |user|
      link_to 'Zmień rolę', change_role_admin_user_path(user)
    end
  end
  member_action :change_role, method: :get do
    @user = User.find(params[:id])
  end


end
