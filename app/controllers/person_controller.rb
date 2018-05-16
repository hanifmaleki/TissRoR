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
      @person_params=Hash.new
      @person_params[:id]= @person["tiss_id"]
      @person_params[:firstname]= @person["firstname"]
      @person_params[:lastname]= @person["lastname"]
      @person_params[:gender]= @person["gender"]
      @person_params[:preceding_titles]= @person["preceding_titles"]
      @person_params[:picture_uri]= @person["picture_uri"]
      @person_params[:main_phone_number]= @person["main_phone_number"]
      @person_params[:main_email]= @person["main_email"]
      @person_params[:consultation_hour_info]= @person["consultation_hour_info"]

      @hash = @person_params
      @controller=self
    end

  end
end
