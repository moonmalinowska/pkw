ActiveAdmin.register Voivodship do


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

  permit_params :name


  form do |f|
    f.actions
    f.inputs 'coś' do

      f.input :name
      f.input :commitees, :as => :check_boxes
    end
    f.actions


  end



end
