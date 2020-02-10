module APIHelpers
  module PaginationHelper
    def pagination(objects)
      return objects if params[:page].blank?

      page = ::Paginator.page(objects, params)
      @pagination_info = page.info
      # return objects with pagination
      page.list
    end
  end
end
