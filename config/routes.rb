Rails.application.routes.draw do
  root to: 'pages#super_secret'

  resource :sessions, only: [:new, :create, :destroy, :show], as: 'auth_sessions'

  resource :pages do
    collection do
      get 'super_secret'
    end
  end
end
