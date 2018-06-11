class CourseController < ApplicationController
  before_action :logged_in_user

  def search
  end

  def list
    @expression = params[:expression]
    @controller = controller_name
    page = 1
    if(params[:page])
      page = params[:page].to_s.to_i
    end
    tu_rest_factory = TURestFactory.new
    tu_rest_factory_search_people = tu_rest_factory.search_course(@expression, page)
    puts tu_rest_factory_search_people
    response = JSON.parse tu_rest_factory_search_people.body
    results = response["results"]
    @list = []
    results.each do |result|
      title = result["title"]
      array = title.split()
      courseNumber = array[0].gsub(/[^0-9]/, '')
      semesterCode = array[array.length-1]
      item = {:title => title, :id => "#{courseNumber}-#{semesterCode}"}
      @list.push(item)
    end
    total_results=response["total_results"]
    @list = WillPaginate::Collection.create(page, TURestFactory::PAGE_SIZE, total_results) do |pager|
      pager.replace(@list.to_a)
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
