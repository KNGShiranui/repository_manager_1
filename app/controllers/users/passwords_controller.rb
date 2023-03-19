# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  # ここにカスタマイズしたい処理を記述します。
  # 例：パスワード再設定後のリダイレクト先を変更する
  protected
  def after_resetting_password_path_for(resource)
    custom_path
  end
end
