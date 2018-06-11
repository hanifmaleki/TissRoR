require 'will_paginate/array'
class FavouriteController < ApplicationController
  before_action :logged_in_user

  def add
    @favourite = Favourite.new
    @favourite.user_id = current_user[:id]
    @favourite.item_id = params[:id]
    @favourite.title = params[:title]
    @favourite.item_type = params[:type]
    @favourite.save

    respond_to do |format|
      format.html { redirect_back  fallback_location: @post}
      format.js
    end
  end

  def remove
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
    page = 1
    if(params[:page])
       page = params[:page].to_s.to_i
    end
    results = Favourite.where(user_id: current_user[:id], item_type: params[:type]).paginate(:page => page, :per_page => TURestFactory::PAGE_SIZE)
    puts "A", results.class, results.to_s
    #@list = @list.map {|item| {:title => item.title, :id => item.item_id}}
    #puts "B", @list.class

    results.each do |item|
      var = {:title => item.title, :id => item.item_id}
      @list.push var
    end
    @list = @list.paginate(:page => page, :per_page => TURestFactory::PAGE_SIZE)


        #.find_each do |favourite|
      #item = {:title =>favourite.item_title, :id => favourite.item_id}
      #puts item
      #@list.push(item)
    #end



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
