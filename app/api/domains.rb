class Domains < Grape::API
  format :json
  version 'v1'

  helpers APIHelpers::PaginationHelper

  desc 'Domain index'
  # params: page, per_page, query, order_type, order_column
  get '/status' do
    domains = Domains::IndexService.new.call(params).data
    domains = pagination(domains)
    present domains, with: Entities::DomainEntity
  end

  desc 'Domain create'
  params { requires :name, type: String, desc: 'name' }
  post '/domain' do
    result = Domains::CreationService.new.call(params)
    if result.success?
      present result.data, with: Entities::DomainEntity
    else
      error!({ 'error_msg' => result.data }, 200)
    end
  end
end
