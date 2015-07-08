class AddPostIdToSummary < ActiveRecord::Migration
  def change
    add_column :summaries, :post_id, :integer
  end
end