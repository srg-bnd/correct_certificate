class Domains::FilteringService < Service
  def initialize(domains)
    @domains = domains
  end

  def call(params = {})
    domains = @domains
    query = params[:query]

    if query.present?
      domains = with_query(domains, query)
    end

    success(domains)
  end

  private

  def with_query(domains, query)
    query = "%#{query}%"
    domains.where('name ILIKE :query', query: query)
  end
end
