class Registrant < ActiveRecord::Base
  before_save :checkeche

  def checkeche
    false
  end

end
