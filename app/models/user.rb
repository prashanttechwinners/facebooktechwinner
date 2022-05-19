class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, :trackable,
         :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
    end
  end                             
  
  has_many :friend_sent, class_name: 'Friend',
                        foreign_key: 'friend_id',
                        inverse_of: 'friend',
                        dependent: :destroy
  has_many :friend_request, class_name: 'Friend',
                        foreign_key: 'user_id',
                        inverse_of: 'user',
                        dependent: :destroy
  has_many :friends, -> { merge(User.friends) },
          through: :friend_sent, source: :user
  has_many :pending_requests, -> { merge(User.not_friends) },
          through: :friend_sent, source: :user
  has_many :received_requests, -> { merge(User.not_friends) },
          through: :friend_request, source: :friend

  # def confirm!
  #   welcome_email
  #   super
  # end    

  #  protected

  # def welcome_email
  #   UserMailer.welcome_email(self).deliver
  # end

  # has_many :friendships, dependent: :destroy
  # has_many :friends, through: :friendships
  # has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  # has_many :inverse_friends, through: :inverse_friendships, source: :user

  # has_many :posts, dependent: :destroy #change
  # has_many :comments #change
end

# has_many :incoming_friend_requests,
#     class_name: 'FriendRequest',
#     source: :friend
# end