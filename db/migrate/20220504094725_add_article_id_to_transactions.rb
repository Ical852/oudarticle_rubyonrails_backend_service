class AddArticleIdToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :article_id, :integer
  end
end
