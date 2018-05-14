require 'json'
class PersonController < ApplicationController
  def search
  end

  def doInvoke
    puts "Eshgh Joonam"
    puts params
    puts "Eshghe Khodam"
    puts params[:expression]
    @myVar = params[:expression]
    expr = @myVar
    tu_rest_factory = TURestFactory.new
    tu_rest_factory_search_people = tu_rest_factory.search_people(expr)
    puts tu_rest_factory_search_people
    response = JSON.parse tu_rest_factory_search_people.body
    puts "======================================="
    puts response
    puts "*****************************************"
    puts response["results"]
    @list = response["results"]
    puts "///////////////////////////////////////////////"

  end
end
