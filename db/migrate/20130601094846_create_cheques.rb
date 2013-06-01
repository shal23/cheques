class CreateCheques < ActiveRecord::Migration
  def change
    create_table :cheques do |t|
      t.string :amount
      t.string :drawer
      t.string :payee

      t.timestamps
    end
  end
end
