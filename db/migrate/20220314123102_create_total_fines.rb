class CreateTotalFines < ActiveRecord::Migration[5.2]
  def change
    create_table :total_fines do |t|

      t.timestamps
    end
  end
end
