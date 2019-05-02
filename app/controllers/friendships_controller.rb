class FriendshipsController < ApplicationController
  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    @username = @friendship.friend.full_name
    @friendship.destroy
    flash[:danger] = "Friend #{@username} is removed"
    redirect_to my_friends_path
  end
end