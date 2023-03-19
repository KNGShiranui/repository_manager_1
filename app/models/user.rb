class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :omniauthable, omniauth_providers: %i[github]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :repositories, dependent: :destroy
  has_many :commits, dependent: :destroy
  has_many :assignees, dependent: :destroy
  has_many :issues, through: :assignees
  has_many :team_members, dependent: :destroy
  has_many :teams, through: :team_members
  has_many :owned_teams, class_name: 'Team', foreign_key: 'owner_id', dependent: :destroy
  
  validates :name, presence: true

  # has_secure_password
  #上の記述はいらないのでコメントアウト。deviseでencrypt_passwordを使用しているので。

end
