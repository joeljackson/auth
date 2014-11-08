Rails.application.routes.draw do
  resource :sessions, only: [:new, :create, :delete], as: 'auth_sessions'

  resource :pages do
    collection do
      get 'super_secret'
    end
  end
end
