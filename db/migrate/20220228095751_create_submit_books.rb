class CreateSubmitBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :submit_books do |t|

      t.timestamps
    end
  end
end
