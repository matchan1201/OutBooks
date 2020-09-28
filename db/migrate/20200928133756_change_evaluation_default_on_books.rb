class ChangeEvaluationDefaultOnBooks < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :evaluation, :integer, :default => 3
  end
end
