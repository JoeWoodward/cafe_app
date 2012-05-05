Riverspring::Application.routes.draw do
  root :to => 'static_pages#home'
  match 'menu' => 'static_pages#menu', as: 'menu'
  match 'location' => 'static_pages#location', as: 'location'

  match 'login' => 'admin/sessions#new'
  match 'admin/login' => 'admin/sessions#new', as: 'login'
  get 'logout' => 'admin/sessions#destroy', as: 'logout'

  namespace :admin do
    root to: redirect('/admin/specials')

    resources :section, path: '', only: [] do
      resources :categories do
        collection do
         get 'reorder' => 'categories#reorder'
         post 'sort' => 'categories#sort'
        end
        resources :menu_items, path: 'menu-items', as: 'menu_items' do
          collection do
           get 'reorder' => 'menu_items#reorder'
           post 'sort' => 'menu_items#sort'
          end
        end
      end
    end
    resources :specials do
      collection do
       get 'reorder' => 'specials#reorder'
       post 'sort' => 'specials#sort'
      end
    end
    resources :users
    resources :sessions
    resources :password_resets, path: 'password-resets', as: 'password_resets'
  end
end
