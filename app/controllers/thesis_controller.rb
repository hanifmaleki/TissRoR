class ThesisController < ApplicationController
  def search
  end

  def list
    @expression = params[:expression]
    @controller = self
    tu_rest_factory = TURestFactory.new
    tu_rest_factory_search_people = tu_rest_factory.search_thesis(@expression)
    response = JSON.parse tu_rest_factory_search_people.body
    results = response["results"]
    puts results
    @list = []
    results.each do |result|
      item = {:name => result["title"], :id => result["id"]}
      @list.push(item)
    end
  end

  def detail
    id = params[:id]
    if (id.nil?)
      #puts "EMpty"
      #TODO fill it
    else
      #puts "Not Empty"
      tu_rest_factory = TURestFactory.new
      response = tu_rest_factory.getThesis(id)

      #puts response.parsed_response["tuvienna"]["thesis"].class
      @thesis = response.parsed_response["tuvienna"]["thesis"]
      #puts "Just title", @thesis["title"]
      #puts "English title", @thesis["title"]["en"]
      @hash = Hash.new
      @hash[:id] = id
      @hash[:type] = @thesis["thesisType"]
      @hash[:title] = @thesis["title"]["en"]
      @hash[:institue] = @thesis["instituteCode"]
      @hash[:institueName] = @thesis["instituteName"]["en"]
      @hash[:facultyName] = @thesis["facultyCode"]
      @hash[:facultyCode] = @thesis["facultyName"]["en"]
      @hash[:keywords] = @thesis["keywords"]["en"]
      @hash[:language] = @thesis["offeredLanguage"]
      #todo complete it
      @hash[:advisor] = @thesis["advisor"]["familyName"]

      @controller = self
      @user = current_user
    end
  end
end
