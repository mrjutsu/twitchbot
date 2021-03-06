class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  has_one :dashboard, dependent: :destroy

  def self.from_twitch usuario
    u = User.where(email: usuario["body"]["email"]).first_or_create do |user|
      user.email = usuario["body"]["email"]
      user.username = usuario["body"]["name"]
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.set_token (session,user,token)
    user.update_attributes( auth_token: token )
  end

end
