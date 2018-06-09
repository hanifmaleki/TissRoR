class CourseController < ApplicationController
  def search
  end

  def list
    @expression = params[:expression]
    @controller = controller_name
    tu_rest_factory = TURestFactory.new
    tu_rest_factory_search_people = tu_rest_factory.search_course(@expression)
    puts tu_rest_factory_search_people
    response = JSON.parse tu_rest_factory_search_people.body
    results = response["results"]
    @list = []
    results.each do |result|
      title = result["title"]
      array = title.split()
      courseNumber = array[0].gsub(/[^0-9]/, '')
      semesterCode = array[array.length-1]
      item = {:name => title, :id => "#{courseNumber}-#{semesterCode}"}
      @list.push(item)
    end
  end

  def detail
    puts params
    id = params[:id]
    if (id.nil?)
      puts "EMpty"
      #TODO fill it
    else
      puts "Not Empty"
      entity_extractor = EntityExtractor.new
      @hash = entity_extractor.grtCourse(id)
      @controller = controller_name
      @user = current_user
    end
  end

end
