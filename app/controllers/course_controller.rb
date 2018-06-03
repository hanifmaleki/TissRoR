class CourseController < ApplicationController
  def search
  end

  def list
    @expression = params[:expression]
    @controller = self
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
      tu_rest_factory = TURestFactory.new
      response = tu_rest_factory.getCourse(id)
      @course = response.parsed_response["tuvienna"]["course"]
      @hash = Hash.new
      @hash[:id]=id
      @hash[:courseNumber]=@course["courseNumber"]
      @hash[:semesterCode]=@course["semesterCode"]
      @hash[:title]=@course["title"]["lang:en"]
      @hash[:objective]=@course["objective"]["lang:en"]
      #todo correct dictation
      @hash[:trachingContent]=@course["teachingContent"]["lang:en"]
      @hash[:lectureNotes]=@course["lectureNotes"]["lang:en"]
      @hash[:examinationModalities]=@course["lectureNotes"]["lang:en"]
      #@hash[:recommendation]=@course["recommendation"]["lang:en"]
      #@hash[:precedingCourses]=
      @hash[:weeklyHours]=@course["weeklyHours"]
      @hash[:lecturers]=@course["lecturers"]
      @hash[:instituteCode]=@course["instituteCode"]
      @hash[:instituteName]=@course["instituteName"]["lang:en"]
      @hash[:registration]=@course["registration"]
      @hash[:language]=@course["language"]["lang:en"]
      @controller = self
      @user = current_user
    end
  end
end
