# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  ################################ API ###############################
  draw(:api_v1)

  # Defines the root path route ("/")
  # root "articles#index"
end
