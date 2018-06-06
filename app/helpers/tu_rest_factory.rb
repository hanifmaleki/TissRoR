require 'rubygems'
require 'httparty'
class TURestFactory
  include HTTParty
  base_uri 'https://tiss.tuwien.ac.at/api'
  #https://tiss.tuwien.ac.at/api/person/v21/psuche
  $countStr="&count=150"

  def search_people(expr)
    count = "&max_treffer=150"
    string = "/person/v21/psuche?q=#{expr}#{count}"
    puts string
    self.class.get(string)
  end

  def getPerson(id)
    string = "/person/v21/id/#{id}"
    self.class.get(string)
  end

  def search_course(expr)
    string = "/search/course/v1.0/quickSearch?searchterm=#{expr}#{$countStr}"
    self.class.get(string)
  end

  def search_thesis(expr)
    string = "/search/thesis/v1.0/quickSearch?searchterm=#{expr}#{$countStr}"
    puts string
    self.class.get(string)
  end

  def search_project(expr)
    string = "/search/projectFullSearch/v1.0/projects?searchterm=#{expr}#{$countStr}"
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

  @@instance = TURestFactory.new

  #def self.instance
  #  return @@instance
  #end

  #private_class_method :new
end