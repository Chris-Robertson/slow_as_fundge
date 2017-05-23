class CreateHackerQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :hacker_quotes do |t|
      t.text :quote

      t.timestamps
    end
  end
end
