require 'rubygems'
require 'httparty'
class TURestFactory
  include HTTParty
  base_uri 'https://tiss.tuwien.ac.at/api'
  #https://tiss.tuwien.ac.at/api/person/v21/psuche

  def search_people(expr)
    string = "/person/v21/psuche?q=#{expr}"
    puts string
    self.class.get(string)
  end

  def getPerson(id)
    string = "/person/v21/id/#{id}"
    self.class.get(string)
  end

  def search_course(expr)
    string = "/search/course/v1.0/quickSearch?searchterm=#{expr}"
    self.class.get(string)
  end

  def search_thesis(expr)
    string = "/search/thesis/v1.0/quickSearch?searchterm=#{expr}"
    self.class.get(string)
  end

  def search_project(expr)
    string = "/search/projectFullSearch/v1.0/projects?searchterm=#{expr}"
    self.class.get(string)
  end

end