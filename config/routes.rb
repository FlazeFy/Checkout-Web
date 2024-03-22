Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  Rails.application.routes.draw do
    scope "/", controller: "checkout" do
      get "/", action: "index", as: "checkout"
      post "/", action: "create_checkout"
    end 
    
    scope "/history", controller: "history" do
      get "/", action: "index", as: "history"
    end 

    scope "/setting", controller: "setting" do
      get "/", action: "index", as: "setting"
      post "/", action: "create_place"
    end 
  end  
end
