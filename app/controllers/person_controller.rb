require 'json'
class PersonController < ApplicationController
  def search
  end

  def list
    @expression = params[:expression]
    @controller = controller_name
    tu_rest_factory = TURestFactory.new
    tu_rest_factory_search_people = tu_rest_factory.search_people(@expression)
    response = JSON.parse tu_rest_factory_search_people.body
    results = response["results"]
    @list = []
    results.each do |item|
      pref = item["prefixTitle"] || ""
      post = item["postfixTitle"] || ""
      firstname = item["firstname"] || ""
      lastname = item["lastname"] || ""
      fullname = "#{pref} #{firstname} #{lastname} #{post}"

      person = {:title => fullname, :id => item["id"]}
      @list.push(person)
    end
  end

  def detail
    #id = params[:person_id]
    puts params
    id = params[:id]
    if(id.nil?)
      puts "EMpty"
      #TODO fill it
    else
      puts "Not Empty"
      entity_extractor = EntityExtractor.new
      @hash = entity_extractor.getPerson(id)

      @user = current_user
      @controller=controller_name
    end

  end

end
