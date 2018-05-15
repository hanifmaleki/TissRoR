require 'json'
class PersonController < ApplicationController
  def search
  end

  def doInvoke
    @expression = params[:expression]
    expr = @expression
    tu_rest_factory = TURestFactory.new
    tu_rest_factory_search_people = tu_rest_factory.search_people(expr)
    response = JSON.parse tu_rest_factory_search_people.body
    @list = response["results"]
  end

  def detail
    id = params[:person_id]
    if(id.empty?)
      puts "EMpty"
      #TODO fill it
    else
      puts "Not Empty"
      tu_rest_factory = TURestFactory.new
      response = tu_rest_factory.getPerson(id)

      puts response.body
      puts response.body.class
      puts "=================================="
      puts response.parsed_response
      puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
      puts response.parsed_response["tuvienna"]["person"].class
      @person = response.parsed_response["tuvienna"]["person"]
    end

  end
end
