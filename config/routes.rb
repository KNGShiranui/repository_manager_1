Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # 他のモデルに関連するルーティングを追加
  resources :issues
  resources :commits
  resources :diffs
  resources :repositories do
    resources :branches
    resources :issues
  end
  resources :repository_holder_teams
  resources :team_members
  resources :teams

  # ルートパスを設定
  root 'sessions#new'
end
