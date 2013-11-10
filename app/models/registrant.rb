class Registrant < ActiveRecord::Base
  before_validation :set_confirm_fields

  validates_presence_of :email
  # The (?:…) construct provides grouping without capturing.
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_uniqueness_of :email

  validates_presence_of :confirmation_code

  def set_confirm_fields
    if self.new_record?
      self.is_confirmed=false
      begin
        self.confirmation_code=rand(36**24).to_s(36)
      end while Registrant.where(:confirmation_code => self.confirmation_code).count != 0
    end
  end

end
