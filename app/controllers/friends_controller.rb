class FriendsController < ApplicationController
    # before_action :authenticate_user!
    # before_action :set_platform
  def index
    @users = User.all
    @friends = Friend.all.where(status: 'pending')
    @ac_friends = Friend.all.where(status: 'accepted')

  end

  def new   
  end

  # def edit
  # end

  def create
    # @friendship = current_user.friendships.build(friend_id: params[:friend_id], confirmed: false)
    # if @friendship.save
    #     flash[:notice] = "Friend Request Sent."
    #     redirect_to friends_path
    # else
    #     flash[:notice] = "Unable to send friend request."
    #     redirect_to friends_path
    # end
  end


   def add_friend
    @friend = Friend.new(user_id: current_user.id, friend_id: params[:id],status: 'pending')
    
    if @friend.save
          flash[:notice] = "Friend Request Sent."
          redirect_to friends_path
      else
          flash[:notice] = "Unable to send friend request."
          redirect_to friends_path
      end      
   end

    def destroy
      @friend = Friend.find(params[:id])
      @friend.destroy

    #   @friend = current_user.friends.find_by(friend_id: params[:id]).first
    # if @friend.exists? 
    #   @friend.destroy
    # end
    # @friend_2 = Friend.where(user_id: params[:id], friend_id: current_user.id).first
    # if @friend_2.exists?
    #   @friend_2.destroy
    # end
    # flash[:notice] = "Friend destroyed"
    # redirect_to current_user

      @user.friends.destroy
      redirect_to friends_path
    end

  # def friends_list
  #   friends_array = friendships.map{|friendship| friendship.friend if friendship.confirmed}
  #   friends_array + inverse_friendships.map{|friendship| friendship.user if friendship.confirmed}
  #   friends_array.compact
  # end

  # #users who haven't accepted friend request
  # def pending_friends
  #   friendships.map{|friendship| friendship.friend if !friendship.confirmed}.compact
  # end

  # #users who have requested to be friends
  # def friend_requests
  #   inverse_friendships.map{|friendship| friendship.user if !friendship.confirmed}.compact
  # end

  # def confirm_friend(user)
  #   friendship = inverse_friendships.find{|friendship| friendship.user == user}
  #   friendship.confirmed = true
  #   friendship.save
  # end

  # def friend?(user)
  #   friends_list.include?(user)
  # end

  private
    def freinds_params
      params.require(:friend).permit(:user_id,:friend_id,:status)
  end 
end
