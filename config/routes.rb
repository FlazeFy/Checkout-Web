Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  Rails.application.routes.draw do
    scope "/", controller: "checkout" do
      get "/", action: "index", as: "checkout"
      get "/stats_destination", action: "get_total_checkout_destination"
      get "/stats_origin", action: "get_total_checkout_origin"
      
      post "/", action: "create_checkout"
    end 
    
    scope "/history", controller: "history" do
      get "/", action: "index", as: "history"

      delete "/:id", action: "destroy_checkout"
    end 

    scope "/setting", controller: "setting" do
      get "/", action: "index", as: "setting"

      post "/place", action: "create_place"
      post "/dct", action: "create_dct"
      delete "/place/:id", action: "destroy_place"
      delete "/dct/:id", action: "destroy_dct"
    end 
  end  
end
