class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  # respond_to :js

  def create
    relationship = current_user.relationships.create(event_id: params[:event_id])
    redirect_to events_url  #, notice: "#{favorite.blog.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    relationship = current_user.relationships.find_by(event_id: params[:event_id]).destroy
    redirect_to events_url  #notice: "#{favorite.blog.user.name}さんのブログをお気に入り解除しました"
  end

  # def create
  #   @event = Event.find(params[:relationship][:event_id])
  #   current_user.follow!(@event)
  #   respond_with @event
  #   redirect_to events_path
  # end
  #
  # def destroy
  #   @event = Relationship.find(params[:id]).followed
  #   current_user.unfollow!(@event)
  #   respond_with @event
  # end
end
