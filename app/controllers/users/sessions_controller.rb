# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # ここにカスタマイズしたい処理を記述します。  
  # 例：ログイン後のリダイレクト先を変更する
  protected

  def after_sign_in_path_for(resource)
    custom_path
  end
end
