# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # ここにカスタマイズしたい処理を記述します。
  # 例：アカウント登録後のリダイレクト先を変更する

  protected
  
  def after_sign_up_path_for(resource)
    custom_path
  end
end
