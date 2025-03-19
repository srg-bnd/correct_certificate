class Domains::IndexService < Service
  COLUMNS_WITH_IDS = [].freeze

  def call(params)
    domains = Domain.all
    domains = filter_list(domains, params)
    domains = order_list(domains, params)

    success(domains)
  end

  private

  def filter_list(domains, params)
    Domains::FilteringService.new(domains).call(params).data!
  end

  def order_list(projects, params)
    Sorter.new(
      items: projects,
      available_columns: ['created_at'],
      default_column: 'created_at',
      default_type: :desc
    ).call(
      column: params[:order_column],
      type: params[:order_type],
      add_id: COLUMNS_WITH_IDS.include?(params[:order_column])
    )
  end
end
