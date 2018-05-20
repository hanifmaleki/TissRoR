class ProjectController < ApplicationController
  def search
  end

  def list
    @expression = params[:expression]
    @controller = self
    tu_rest_factory = TURestFactory.new
    tu_rest_factory_search_people = tu_rest_factory.search_project(@expression)
    response = JSON.parse tu_rest_factory_search_people.body
    results = response["results"]
    @list = []
    results.each do |result|
      item = {:name => result["title"], :id => result["id"]}
      @list.push(item)
    end
  end

  def detail
    id = params[:id]
    if (id.nil?)
      puts "EMpty"
      #TODO fill it
    else
      puts "Not Empty"
      tu_rest_factory = TURestFactory.new
      response = tu_rest_factory.getProject(id)

      puts response.parsed_response
      puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
      puts response.parsed_response["tuVienna"]["project"].class
      @project = response.parsed_response["tuVienna"]["project"]
      @project_params = Hash.new
      @project_params[:id] = @project["id"]
      @project_params[:title] = @project["titleEn"]
      @project_params[:contractBegin] = @project["contractBegin"]
      @project_params[:contractEnd] = @project["contractEnd"]
      @project_params[:projectBegin] = @project["projectBegin"]
      @project_params[:projectEnd] = @project["projectEnd"]
      @project_params[:projectForm] = @project["projectForm"]
      @project_params[:projectType] = @project["projectType"]
      @project_params[:abstract] = @project["abstractEn"]
      #TODO correct
      #@project_params[:researchArea]= @project["researchAreas"]
      #@project_params[:institute]= @project["institute"]
      #@project_params[:keywords]= @project["keywords"]
      #@project_params[:funding]= @project["funding"]
      #@project_params[:keywords]= @project["keywords"]
      puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
      puts @project_params
      @hash = @project_params
      @controller = self
    end
  end

  def addFav
    @favourite = FavouriteCourse.new
    @favourite.user_id = current_user[:id]
    @favourite.item_id = params[:id]
    @favourite.item_title = params[:item_title]
    @favourite.item_type = "PROJECT"
    @favourite.save
    redirect_to action: "detail"
  end

  def removeFav

  end
end
