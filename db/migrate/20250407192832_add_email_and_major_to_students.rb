class AddEmailAndMajorToStudents < ActiveRecord::Migration[8.0]
  def change
    add_column :students, :email, :string
    add_column :students, :major, :string
    add_column :students, :check_in_count, :integer, default: 1
    add_index :students, :email, unique: true
  end
end
