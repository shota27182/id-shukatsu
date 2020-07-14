class SearchController < ApplicationController
  def index
    @search_params = search_params
    @companies = Company.search(@search_params)
  end
  
  private
  
      def search_params
        params.fetch(:search, {}).permit(:name)
      end
end
