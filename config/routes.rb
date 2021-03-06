Inkblot::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  authenticated :user do
    resources :projects
    root "projects#index"
  end
  unauthenticated :user do
    devise_scope :user do
      root "devise/sessions#new", as: :unauthenticated_root
    end
  end

end
