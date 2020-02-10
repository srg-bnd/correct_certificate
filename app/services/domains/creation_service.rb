class Domains::CreationService < Service
  def call(params)
    domain = Domain.create(params)
    return form_error(domain) unless domain.save

    success(domain)
  end
end
