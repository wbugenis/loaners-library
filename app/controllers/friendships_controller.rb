class FriendshipsController < ApplicationController

  def friends
    @friends = @current_user.friends
  end

  def create
    @friendship = Friendship.create(user_id: @current_user.id, friend_id: params[:id])

    if @friendship.valid?
      flash[:messages] = ["Friend added!"]
    else
      flash[:messages] = @friendship.errors.full_messages.uniq
    end
    redirect_to user_path(params[:id])
  end 
    
  def delete
    @friendship = @current_user.friendships.find_by(friend_id: params[:id])
    @friendship.destroy
    redirect_to user_path(params[:id])
  end

end
