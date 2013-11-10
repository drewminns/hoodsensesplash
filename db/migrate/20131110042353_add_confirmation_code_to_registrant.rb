class AddConfirmationCodeToRegistrant < ActiveRecord::Migration
  def change
    add_column :registrants, :confirmation_code, :string
  end
end
