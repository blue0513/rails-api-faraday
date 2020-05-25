Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :posts
      get 'faraday_get', to: 'faraday#get'
    end
  end
end
