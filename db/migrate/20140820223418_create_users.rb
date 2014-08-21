class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :bundle

      t.timestamps
    end
  end
end
