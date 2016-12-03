class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :events, :end, :end_time
  end
end
