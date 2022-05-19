class Friend < ApplicationRecord
    belongs_to :user    

	# belongs_to :user, class_name: ‘User’, foreign_key: ‘user_id’
 #  belongs_to :friend, class_name: ‘User’, foreign_key: ‘friend_id’
 #  scope :friends, -> { where(‘status =?’, true) }
 #  scope :not_friends, -> { where(‘status =?’, false) }

	# belongs_to :friend, :class_name => 'User', :foreign_key => 'friend_id'

  # validates_presence_of :user_id, :friend_id

  validates :friend_id, uniqueness: true 

  # validate :users_are_not_already_friends

  #   def users_are_not_already_friends
  #     combinations = ["user_id = #{user_id} AND friend_id = #{friend_id}",
  #     "user_id = #{friend_id} AND friend_id = #{user_id}"]
  #     if User.where(combinations.join(' OR ')).exists?
  #       self.errors.add(:user_id, 'Already friends!')
  #     end
  #   end


 #  # Create a friendship request.
 #  def self.send_request(user, friend)
 #    unless user == friend or Friendship.exists?(user, friend)
 #      transaction do
 #        create(:user => user, :friend => friend, :status => 'pending')
 #        create(:user => friend, :friend => user, :status => 'requested')
 #      end
 #    end
 #  end

 #  # Accept a friend request.
 #  def self.accept_request(user, friend)
 #    transaction do
 #      accept_one_side(user, friend)
 #      accept_one_side(friend, user)
 #    end
 #  end

 #  # Decline a request, disconnect or cancel a pending request.
 #  def self.breakup(user, friend)
 #    transaction do
 #      destroy(find_by_user_id_and_friend_id(user, friend))
 #      destroy(find_by_user_id_and_friend_id(friend, user))
 #    end
 #  end

 #  # Return true if the users are (possibly pending) friends.
 #  def self.exists?(user, friend)
 #    not find_by_user_id_and_friend_id(user, friend).nil?
 #  end

 #  private
 #  # Update the db with one side of an accepted friend request.
 #  def self.accept_one_side(user, friend)
 #    request = find_by_user_id_and_friend_id(user, friend)
 #    request.status = 'accepted'
 #    request.save!
 #  end
end
