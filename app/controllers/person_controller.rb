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

  def list
    redirect_to action: 'doInvoke'
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
      @project = response.parsed_response["tuvienna"]["person"]
      @project_params=Hash.new
      @project_params[:id]= @project["tiss_id"]
      @project_params[:firstname]= @project["firstname"]
      @project_params[:lastname]= @project["lastname"]
      @project_params[:gender]= @project["gender"]
      @project_params[:preceding_titles]= @project["preceding_titles"]
      @project_params[:picture_uri]= @project["picture_uri"]
      @project_params[:main_phone_number]= @project["main_phone_number"]
      @project_params[:main_email]= @project["main_email"]
      @project_params[:consultation_hour_info]= @project["consultation_hour_info"]

      @hash = @project_params
      @controller=self
    end

  end

  def addFav
    redirect_to action: 'detail'
  end

  def removeFav
    redirect_to action: 'detail'
  end
end
