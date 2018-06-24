require 'json'
include PersonHelper
class PersonController < AbstractEntityController
  before_action :logged_in_user

  private

  def get_details(id)
    entity_extractor = EntityExtractor.new
    @hash = entity_extractor.getPerson(id)
  end

  def make_list(page)
    tu_rest_factory = TURestFactory.new
    tu_rest_factory_search_people = tu_rest_factory.search_people(@expression)
    response = JSON.parse tu_rest_factory_search_people.body
    results = response["results"]
    @list = []
    results.each do |item|
      fullname = getFullTitle(item)

      person = {:title => fullname, :id => item["id"]}
      @list.push(person)
    end
    @page_size=TURestFactory::PERSON_RESULT_COUNT
    @page_size
  end

end
