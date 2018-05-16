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
    @list =[]
    results.each do |result|
      item = {:name=>result["title"], :id=> result["id"]}
      @list.push(item)
    end
  end

  def detail
  end
end
