class RegistrantsController < ApplicationController
  before_action :set_registrant, only: [:confirm]

  # POST /registrants
  # POST /registrants.json
  def create
    @registrant = Registrant.new(registrant_create_params)

    respond_to do |format|
      if @registrant.save
        format.js
        format.html { redirect_to root_url, notice: 'You have been added, check your email to confirm your addition.' }
        RegistrationMailer.confirmation_email(@registrant).deliver
      else
        format.js {render action: 'create_failure'}
        format.html { redirect_to root_url }
      end
    end
  end

  def confirm
    if @registrant.nil?
      render action: 'confirm_failure'
    else
      @registrant.is_confirmed=true
      if @registrant.save
        render action: 'confirm'
      else
        render action: 'confirm_failure'
      end
    end
  end

  # PATCH/PUT /registrants/1
  # PATCH/PUT /registrants/1.json
  def update
    respond_to do |format|
      if @registrant.update(registrant_create_params)
        format.html { redirect_to @registrant, notice: 'registrant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @registrant.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_registrant
    @registrant = Registrant.where("id=? and confirmation_code=?", params[:id], params[:code]).first
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def registrant_create_params
    params.require(:registrant).permit(:email)
  end
end
