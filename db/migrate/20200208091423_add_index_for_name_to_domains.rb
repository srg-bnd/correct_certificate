class AddIndexForNameToDomains < ActiveRecord::Migration[6.0]
  def change
    add_index :domains, :name,
              name: 'index_domains_on_name_with_gist',
              using: 'gist', opclass: :gist_trgm_ops
  end
end
