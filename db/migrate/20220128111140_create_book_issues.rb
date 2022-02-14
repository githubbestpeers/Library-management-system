class CreateBookIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :book_issues do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.datetime :issue_date
      t.datetime :submit_date
validates :day, timeliness: { on_or_before: lambda { Date.current }, type: :day }
      t.timestamps
    end
  end
end
