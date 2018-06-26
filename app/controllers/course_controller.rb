class CourseController < AbstractEntityController
  before_action :logged_in_user

  private

  def get_details(id)
    entity_extractor = EntityExtractor.new
    entity_extractor.getCourse(id)
    #@hash=entity_extractor.getCourse(id)
    #professors= @hash[:lecturers]["oid"]
    #puts "professor #{professors.length}"
    #counter = 0
    #professors.each do |prof|
    #  counter = counter +1
      #redirect_to action: 'profFind', format: 'js'
      #profFind
      #post action: 'profFind'
    #end
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

  def profFind
    respond_to do |format|
      #format.html { redirect_back  fallback_location: @post}
      puts "ma injayim-2 #{format.to_s}"
      #format.html { redirect_back  fallback_location: @post}
      format.js { }
    end
  end


end
