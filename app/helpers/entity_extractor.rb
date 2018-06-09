class EntityExtractor

  def grtPeson(id)
    tu_rest_factory = TURestFactory.new
    response = tu_rest_factory.getCourse(id)
    course = response.parsed_response["tuvienna"]["course"]
    #puts course
    hash = Hash.new
    hash[:id] = id
    hash[:courseNumber] = course["courseNumber"]
    hash[:semesterCode] = course["semesterCode"]
    hash[:title] = course["title"]["en"]
    hash[:objective] = course["objective"]["en"]
    #todo correct dictation
    hash[:trachingContent] = course["teachingContent"]["en"]
    hash[:lectureNotes] = course["lectureNotes"]["en"]
    hash[:examinationModalities] = course["lectureNotes"]["en"]
    #hash[:recommendation]=course["recommendation"]["en"]
    #hash[:precedingCourses]=
    hash[:weeklyHours] = course["weeklyHours"]
    hash[:lecturers] = course["lecturers"]
    hash[:instituteCode] = course["instituteCode"]
    hash[:instituteName] = course["instituteName"]["en"]
    hash[:registration] = course["registration"]
    hash[:language] = course["language"]["en"]
    hash
  end
end