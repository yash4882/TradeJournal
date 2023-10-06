class CreateTrades < ActiveRecord::Migration[7.0]
  def change
    create_table :trades do |t|
      t.datetime :date
      t.string :scrip
      t.string :position
      t.string :conviction
      t.string :trade_reason 
      t.integer :quantity
      t.float :entry_price
      t.float :stoploss
      t.float :risk
      t.float :target
      t.float :reward
      t.string :riskreward
      t.float :exit_price
      t.string :profit_loss
      t.string :rr_achieved
      t.string :learning
      t.string :mistakes
      t.timestamps
    end
  end
end
