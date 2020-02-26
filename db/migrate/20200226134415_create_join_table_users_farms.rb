class CreateJoinTableUsersFarms < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :farms do |t|
      # t.index [:user_id, :farm_id]
      # t.index [:farm_id, :user_id]
    end
  end
end
