class ProjectController < ApplicationController
  before_action :logged_in_user

  def search
  end

  def list
    @expression = params[:expression]
    @controller = controller_name
    tu_rest_factory = TURestFactory.new
    tu_rest_factory_search_people = tu_rest_factory.search_project(@expression)
    response = JSON.parse tu_rest_factory_search_people.body
    results = response["results"]
    @list = []
    results.each do |result|
      item = {:title => result["title"], :id => result["id"]}
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
      entity_extractor = EntityExtractor.new
      @hash = entity_extractor.getProject(id)
      @controller = controller_name
      @user = current_user
    end
  end
end
