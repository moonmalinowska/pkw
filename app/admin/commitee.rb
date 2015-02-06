ActiveAdmin.register Commitee do


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


  permit_params :name, :logo, :party,
                voivodship_ids: []

  form do |f|
    f.actions
    f.inputs 'coś' do
      #f.input :voivodships, :as => :select, :input_html => {:multiple => true}
      f.input :name
      f.input :logo
      f.input :party
    end
    f.actions
  end

end
