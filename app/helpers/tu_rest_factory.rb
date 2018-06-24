require 'rubygems'
require 'httparty'
class TURestFactory
  include HTTParty
  base_uri 'https://tiss.tuwien.ac.at/api'
  #https://tiss.tuwien.ac.at/api/person/v21/psuche
  #$countStr="&count=15"
  #todo move to project configurable settings
  PAGE_SIZE=15
  PERSON_RESULT_COUNT=30

  def search_people(expr)
    count = "&max_treffer=#{PERSON_RESULT_COUNT}"
    string = "/person/v21/psuche?q=#{expr}#{count}"
    puts string
    self.class.get(string)
  end

  def getPerson(id)
    string = "/person/v21/id/#{id}"
    self.class.get(string)
  end

  def search_course(expr, page=1)
    string = "/search/course/v1.0/quickSearch?searchterm=#{expr}#{getPaginatoin(page)}"
    self.class.get(string)
  end

  def search_thesis(expr, page=1)
    string = "/search/thesis/v1.0/quickSearch?searchterm=#{expr}#{getPaginatoin(page)}"
    puts string
    self.class.get(string)
  end

  def search_project(expr, page=1)
    string = "/search/projectFullSearch/v1.0/projects?searchterm=#{expr}#{getPaginatoin(page)}"
    puts "string is #{string}"
    self.class.get(string)
  end

  def getProject(id)
    string = "/pdb/rest/project/v2/#{id}"
    self.class.get(string)
  end

  def getCourse(id)
    string = "/course/#{id}"
    puts string
    self.class.get(string)
  end

  def getThesis(id)
    string = "/thesis/#{id}"
    self.class.get(string)
  end

  #@@instance = TURestFactory.new
  private
  def getPaginatoin(page)
    "&count=#{PAGE_SIZE}&offset=#{(page-1)*PAGE_SIZE}&locale=en"
  end



end