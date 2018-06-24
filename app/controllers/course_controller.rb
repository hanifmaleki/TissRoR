class CourseController < AbstractEntityController
  before_action :logged_in_user

  private

  def get_details(id)
    entity_extractor = EntityExtractor.new
    entity_extractor.getCourse(id)
  end

  def make_list(page)
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
    response["total_results"]
  end


end
