class AbstractEntityController < ApplicationController

  def make_list(page); raise MESS; end
  def get_details(id); raise MESS; end

  def search
    @search_request = SearchRequest.new
  end

  def list
    @search_request = SearchRequest.new(search_params)
    if @search_request.valid?
      @expression = params[:search_request][:expression]
      @controller = controller_name
      page = 1
      if (params[:page])
        page = params[:page].to_s.to_i
      end
      @page_size = TURestFactory::PAGE_SIZE
      total_results = make_list(page)
      puts 'params is', total_results
      @list.map! {|item|
        favourite_find_by = Favourite.find_by(user_id: current_user[:id], item_id: item[:id])
        element =  {:title => item[:title], :id => item[:id], :isFavourite=> !(favourite_find_by.nil?)}
        #puts element
        element
      }

      @list = WillPaginate::Collection.create(page, @page_size, total_results) do |pager|
        pager.replace(@list.to_a)
      end

    else
      render 'search'
    end

  end


  def detail
    id = params[:id]
    if (id.nil?)
      puts "EMpty"
      #TODO fill it
    else
      puts "Not Empty"
      @hash = get_details(id)
      @controller = controller_name
      @user = current_user
    end
  end

  private
  def search_params
    params.require(:search_request).permit(:expression)
  end
end