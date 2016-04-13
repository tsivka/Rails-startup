class AddBusinesstypeIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :businesstype, index: true, foreign_key: true
  end
end
