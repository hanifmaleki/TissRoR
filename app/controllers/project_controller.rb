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

      puts response.parsed_response["tuVienna"]["project"].class
      @thesis = response.parsed_response["tuVienna"]["project"]
      @hash = Hash.new
      @hash[:id] = @thesis["id"]
      @hash[:title] = @thesis["titleEn"]
      @hash[:contractBegin] = @thesis["contractBegin"]
      @hash[:contractEnd] = @thesis["contractEnd"]
      @hash[:projectBegin] = @thesis["projectBegin"]
      @hash[:projectEnd] = @thesis["projectEnd"]
      @hash[:projectForm] = @thesis["projectForm"]
      @hash[:projectType] = @thesis["projectType"]
      @hash[:abstract] = @thesis["abstractEn"]
      #TODO correct
      #@project_params[:researchArea]= @project["researchAreas"]
      #@project_params[:institute]= @project["institute"]
      #@project_params[:keywords]= @project["keywords"]
      #@project_params[:funding]= @project["funding"]
      #@project_params[:keywords]= @project["keywords"]
      puts @hash
      @hash = @hash
      @controller = self
      @user = current_user
    end
  end

end
