Rails.application.routes.draw do
resources :students, except: [:edit, :new]
resources :instructors, except: [:edit, :new]

end
