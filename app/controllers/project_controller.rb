class ProjectController < AbstractEntityController
  before_action :logged_in_user

  private

  def get_details(id)
    entity_extractor = EntityExtractor.new
    entity_extractor.getProject(id)
  end

  def make_list(page)
    tu_rest_factory = TURestFactory.new
    tu_rest_factory_search_people = tu_rest_factory.search_project(@expression, page)
    response = JSON.parse tu_rest_factory_search_people.body
    results = response["results"]
    @list = []
    results.each do |result|
      item = {:title => result["title"], :id => result["id"]}
      @list.push(item)
    end
    response["total_results"]
  end
end
