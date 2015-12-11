Rails.application.routes.draw do

  root 'hospitals#index'

  # Routes for the Review resource:
  # CREATE
  get "/reviews/new", :controller => "reviews", :action => "new"
  post "/create_review", :controller => "reviews", :action => "create"

  # READ
  get "/reviews", :controller => "reviews", :action => "index"
  get "/reviews/:id", :controller => "reviews", :action => "show"

  # UPDATE
  get "/reviews/:id/edit", :controller => "reviews", :action => "edit"
  post "/update_review/:id", :controller => "reviews", :action => "update"

  # DELETE
  get "/delete_review/:id", :controller => "reviews", :action => "destroy"
  #------------------------------

  # Routes for the Department resource:
  # CREATE
  get "/departments/new", :controller => "departments", :action => "new"
  post "/create_department", :controller => "departments", :action => "create"

  # READ
  get "/departments", :controller => "departments", :action => "index"
  get "/departments/:id", :controller => "departments", :action => "show"

  # UPDATE
  get "/departments/:id/edit", :controller => "departments", :action => "edit"
  post "/update_department/:id", :controller => "departments", :action => "update"

  # DELETE
  get "/delete_department/:id", :controller => "departments", :action => "destroy"
  #------------------------------

  # Routes for the Hospital resource:
  # CREATE
  get "/hospitals/new", :controller => "hospitals", :action => "new"
  post "/create_hospital", :controller => "hospitals", :action => "create"

  # READ
  get "/hospitals", :controller => "hospitals", :action => "index"
  get "/hospitals/:id", :controller => "hospitals", :action => "show"

  # UPDATE
  get "/hospitals/:id/edit", :controller => "hospitals", :action => "edit"
  post "/update_hospital/:id", :controller => "hospitals", :action => "update"

  # DELETE
  get "/delete_hospital/:id", :controller => "hospitals", :action => "destroy"
  #------------------------------

  devise_for :users

  get "/my_reviews", :controller => "reviews", :action => "my_reviews"

end
