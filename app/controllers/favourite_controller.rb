class FavouriteController < ApplicationController
  before_action :logged_in_user

  def add
    puts 'inside add'
    puts params
    @favourite = Favourite.new
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
    @favourite = Favourite.find_by(user_id: current_user[:id], item_id: params[:id])
    @favourite.destroy
    respond_to do |format|
      format.html { redirect_back  fallback_location: @post}
      format.js
    end
  end

  def show
    @type=params[:type]
    @list=[]
    #favourites = Favourite.where(user_id: current_user[:id], item_type: params[:type])
    Favourite.where(user_id: current_user[:id], item_type: params[:type]).find_each do |favourite|
      item = {:title =>favourite.item_title, :id => favourite.item_id}
      puts item
      @list.push(item)
    end

    if(@type=="THESIS")
        @controller = 'thesis'
    end
    if(@type=="PROJECT")
      @controller = 'project'
    end
    if(@type=="COURSE")
      @controller = 'course'
    end
    if(@type=="PERSON")
      @controller = 'person'
    end

  end
end
