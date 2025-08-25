Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check
  post "department/create", to: "departments#create"
  get "department/get", to: "departments#index"
  get "department/get/:id", to: "departments#show"
  put "department/update/:id", to: "departments#update"
  patch "department/update/:id", to: "departments#update"
  delete "department/delete/:id", to: "departments#delete" 

  post "employee/create", to: "employees#create"
  get "employee/get", to: "employees#index"
  get "employee/get/:id", to: "employees#show"
  put "employee/update/:id", to: "employees#update"
  patch "employee/update/:id", to: "employees#update"
  delete "employee/delete/:id", to: "employees#delete" 


end
