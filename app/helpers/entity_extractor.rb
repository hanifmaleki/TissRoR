class EntityExtractor
  include PersonHelper
  def getCourse(id)
    tu_rest_factory = TURestFactory.new
    response = tu_rest_factory.getCourse(id)
    course = response.parsed_response["tuvienna"]["course"]
    puts "course is #{course} for id #{id}"
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

  def getPerson(id)
    tu_rest_factory = TURestFactory.new
    response = tu_rest_factory.getPerson(id)
    person = response.parsed_response["tuvienna"]["person"]
    hash = Hash.new
    hash[:id] = person["tiss_id"]
    hash[:firstname] = person["firstname"]
    hash[:lastname] = person["lastname"]
    hash[:gender] = person["gender"]
    hash[:preceding_titles] = person["preceding_titles"]
    hash[:picture_uri] = person["picture_uri"]
    hash[:main_phone_number] = person["main_phone_number"]
    hash[:main_email] = person["main_email"]
    hash[:consultation_hour_info] = person["consultation_hour_info"]
    hash[:title] = getFullTitle(person)
    hash
  end

  def getProject(id)
    tu_rest_factory = TURestFactory.new
    response = tu_rest_factory.getProject(id)
    thesis = response.parsed_response["tuVienna"]["project"]
    hash = Hash.new
    hash[:id] = thesis["id"]
    hash[:title] = thesis["titleEn"]
    hash[:contractBegin] = thesis["contractBegin"]
    hash[:contractEnd] = thesis["contractEnd"]
    hash[:projectBegin] = thesis["projectBegin"]
    hash[:projectEnd] = thesis["projectEnd"]
    hash[:projectForm] = thesis["projectForm"]
    hash[:projectType] = thesis["projectType"]
    hash[:abstract] = thesis["abstractEn"]
    #TODO correct
    #hash[:researchArea]= project["researchAreas"]
    #hash[:institute]= project["institute"]
    #hash[:keywords]= project["keywords"]
    #hash[:funding]= project["funding"]
    #hash[:keywords]= project["keywords"]
    hash
  end

  def getThesis(id)
    tu_rest_factory = TURestFactory.new
    response = tu_rest_factory.getThesis(id)
    thesis = response.parsed_response["tuvienna"]["thesis"]
    hash = Hash.new
    hash[:id] = id
    hash[:type] = thesis["thesisType"]
    hash[:title] = thesis["title"]["en"]
    hash[:institute] = thesis["instituteCode"]
    hash[:instituteName] = thesis["instituteName"]["en"]
    hash[:facultyName] = thesis["facultyCode"]
    hash[:facultyCode] = thesis["facultyName"]["en"]
    hash[:keywords] = thesis["keywords"]["en"]
    hash[:language] = thesis["offeredLanguage"]
    #todo complete it
    hash[:advisor] = thesis["advisor"]["familyName"]
    hash
  end
end