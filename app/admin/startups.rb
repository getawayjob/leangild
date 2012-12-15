ActiveAdmin.register Startup do
  index do
    column :name
    column :user
    column :pitch
    default_actions
  end
end
