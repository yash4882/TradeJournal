class AddReferenceToTrades < ActiveRecord::Migration[7.0]
  def change
    add_reference :trades, :user, foreign_key: true
  end
end
