Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'main/excel', to: 'main#generate_excel'
  resources :main do
    collection do
      get 'show_columns'
      get 'preview'
      get 'remove_column'
    end
  end
  root "main#index"
end
