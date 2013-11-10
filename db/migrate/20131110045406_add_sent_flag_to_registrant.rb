class AddSentFlagToRegistrant < ActiveRecord::Migration
  def change
    add_column :registrants, :sent, :boolean
  end
end
