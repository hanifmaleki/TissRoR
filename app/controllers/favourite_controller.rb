class FavouriteController < ApplicationController

  def add
    puts 'inside add'
    puts params
    @favourite = FavouriteCourse.new
    @favourite.user_id = current_user[:id]
    @favourite.item_id = params[:id]
    @favourite.item_title = params[:item_title]
    @favourite.item_type = params[:type]
    @favourite.save

    #render project_detail_path
    respond_to do |format|
      format.html { redirect_back  fallback_location: @post}
      format.js
    end
  end

  def remove
    puts 'inside remove'
    puts params
    @favourite = FavouriteCourse.find_by(user_id: current_user[:id], item_id: params[:id])
    @favourite.destroy
    respond_to do |format|
      format.html { redirect_back  fallback_location: @post}
      format.js
    end
  end

  def toggle
    puts 'asalami'
    #@favourite = FavouriteCourse.new
    #@favourite.user_id = current_user[:id]
    #@favourite.item_id = params[:id]
    #@favourite.item_title = params[:item_title]
    #@favourite.item_type = "PROJECT"
    #@favourite.save
    #render json: {}
    redirect_to :back
  end
end
