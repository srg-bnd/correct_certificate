class AddAasmStateToDomains < ActiveRecord::Migration[6.0]
  def change
    add_column :domains, :aasm_state, :string
  end
end
