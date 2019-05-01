class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @user_stocks = @user.stocks
  end
  
  def my_friends
    @friendships = current_user.friends
  end
  
  def search
   if params[:search].blank?
     flash.now[:danger] = "you entered empty string  "
   else
     @users = User.search(params[:search])
     @users = current_user.except_current_user(@users)
     flash.now[:danger]="No User match" if @users.blank?
   end
   respond_to do |format|
      format.js {render partial: 'friends/result'}
    end
  end
  
  def add_friend
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: @friend.id)
    
    if current_user.save
      flash[:success] = "Friend is added"
    else
      flash[:danger] = "something wrong with the request"
    end
    
    redirect_to my_friends_path
  end
end