# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # ここにカスタマイズしたい処理を記述します。
  # 例：メールアドレス確認後のリダイレクト先を変更する
  protected
  def after_confirmation_path_for(resource_name, resource)
    custom_path
  end
end

