class ThesisController < ApplicationController
  before_action :logged_in_user

  def search
  end

  def list
    @expression = params[:expression]
    @controller = controller_name
    tu_rest_factory = TURestFactory.new
    tu_rest_factory_search_people = tu_rest_factory.search_thesis(@expression)
    response = JSON.parse tu_rest_factory_search_people.body
    results = response["results"]
    puts results
    @list = []
    results.each do |result|
      item = {:title => result["title"], :id => result["id"]}
      @list.push(item)
    end
  end

  def detail
    id = params[:id]
    if (id.nil?)

      #TODO fill it
    else
      entity_extractor = EntityExtractor.new
      @hash=entity_extractor.getThesis(id)
      @controller = controller_name
      @user = current_user
    end
  end

end
