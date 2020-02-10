module Entities
  class DomainEntity < Grape::Entity
    expose :name
    expose :aasm_state, as: :status
  end
end
