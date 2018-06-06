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
    @results = response["results"]
    @list = []
    results.each do |item|
      pref = item["prefixTitle"] || ""
      post = item["postfixTitle"] || ""
      firstname = item["firstname"] || ""
      lastname = item["lastname"] || ""
      fullname = "#{pref} #{firstname} #{lastname} #{post}"

      person = {:name => fullname, :id => item["id"]}
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
      tu_rest_factory = TURestFactory.new
      response = tu_rest_factory.getPerson(id)

      puts response.body
      puts response.body.class
      puts "=================================="
      puts response.parsed_response
      puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
      puts response.parsed_response["tuvienna"]["person"].class
      @thesis = response.parsed_response["tuvienna"]["person"]
      @hash=Hash.new
      @hash[:id]= @thesis["tiss_id"]
      @hash[:firstname]= @thesis["firstname"]
      @hash[:lastname]= @thesis["lastname"]
      @hash[:gender]= @thesis["gender"]
      @hash[:preceding_titles]= @thesis["preceding_titles"]
      @hash[:picture_uri]= @thesis["picture_uri"]
      @hash[:main_phone_number]= @thesis["main_phone_number"]
      @hash[:main_email]= @thesis["main_email"]
      @hash[:consultation_hour_info]= @thesis["consultation_hour_info"]

      @hash = @hash
      @controller=controller_name
    end

  end

end
