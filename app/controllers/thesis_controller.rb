class ThesisController < ApplicationController
  def search
  end

  def list
    @expression = params[:expression]
    tu_rest_factory = TURestFactory.new
    tu_rest_factory_search_people = tu_rest_factory.search_thesis(@expression)
    puts tu_rest_factory_search_people
    response = JSON.parse tu_rest_factory_search_people.body
    @list = response["results"]
  end

  def detail
  end
end
