class RelationshipsController < ApplicationController
  def create
    follow_user = User.find(params[:user_id])
    relationship = Relationship.new(user_id: current_user.id, follow_user_id: follow_user.id)
    if relationship.save
      redirect_to user_path(follow_user)
    end
  end

  def destroy
    follow_user = User.find(params[:user_id])
    relationship = Relationship.find_by(user_id: current_user.id, follow_user_id: follow_user.id)
    relationship.destroy
    redirect_to user_path(follow_user)
  end
end
