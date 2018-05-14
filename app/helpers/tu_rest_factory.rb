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
end