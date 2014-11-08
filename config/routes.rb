Rails.application.routes.draw do
  resource :pages do
    collection do
      get 'super_secret'
    end
  end
end
