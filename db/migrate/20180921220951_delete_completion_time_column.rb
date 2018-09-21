class DeleteCompletionTimeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :completion_time
  end
end
