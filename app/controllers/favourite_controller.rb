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

    respond_to do |format|
      format.html { redirect_back  fallback_location: @post}
      format.js
    end
  end

  def remove
    #puts 'inside remove'
    #puts params
    @favourite = FavouriteCourse.find_by(user_id: current_user[:id], item_id: params[:id])
    @favourite.destroy
    respond_to do |format|
      format.html { redirect_back  fallback_location: @post}
      format.js
    end
  end

  def show
    @type=params[:type]
    @list=[]
    #favourites = FavouriteCourse.where(user_id: current_user[:id], item_type: params[:type])
    FavouriteCourse.where(user_id: current_user[:id], item_type: params[:type]).find_each do |favourite|
      item = {:title =>favourite.item_title, :id => favourite.item_id}
      puts item
      @list.push(item)
    end

    #if(@type=="THESIS")
    #    @controller = Controller.
    #end
  end
end
