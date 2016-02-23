class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :omniauthable, omniauth_providers: [:twitch]

  has_one :dashboard, dependent: :destroy

  def self.from_twitch usuario
    u = User.where(email: usuario["body"]["email"]).first_or_create do |user|
      user.email = usuario["body"]["email"]
      user.password = Devise.friendly_token[0,20]
      user.username = usuario["body"]["name"]
    end
  end

end
