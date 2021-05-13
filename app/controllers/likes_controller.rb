class LikesController < ApplicationController
  before_action :find_gossip
  before_action :find_like, only: [:destroy]  

 
  def create
    @gossip = Gossip.find(params[:gossip_id])
    @gossip.user = current_user
    current_user_id = @gossip.user_id
    
    
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @gossip.likes.create(user_id: @gossip.user_id)
    end
    redirect_to gossip_path(@gossip)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to gossip_path(@gossip)
  end

  def find_like
    @like = @gossip.likes.find(params[:id])
 end

  private
  def find_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end
  def already_liked?
    @gossip = Gossip.find(params[:gossip_id])
    @gossip.user = current_user
    current_user_id = @gossip.user_id

    Like.where(user_id: @gossip.user_id, gossip_id: params[:gossip_id]).exists?

  end
end

