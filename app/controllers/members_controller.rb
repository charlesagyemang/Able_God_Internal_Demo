class MembersController < ApplicationController
  before_action :set_member, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[index show update destroy]

  # GET /members or /members.json
  def index
    @members = Member.where("membership_type is null OR membership_type='FULL_MEMBER'")
    @member  = Member.new
  end

  # GET /members/1 or /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        if @member.url_creation == "NEW_MEMBER_QR"
          format.html { redirect_to "/sundry/member_created_successfully/?name=#{@member.name.split(" ")[0]}", notice: "Member was successfully created." }
        else
          if @member.membership_type == "VISITOR" || @member.membership_type == "NEW_SOUL"
            format.html { redirect_to non_member_index_path, notice: "Member was successfully created." }
            format.json { render :show, status: :created, location: @member }
          else
            format.html { redirect_to members_url, notice: "Member was successfully created." }
            format.json { render :show, status: :created, location: @member }
          end
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end

    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        if @member.membership_type == "VISITOR" || @member.membership_type == "NEW_SOUL"
          format.html { redirect_to non_member_index_path, notice: "Member was successfully updated." }
          format.json { render :show, status: :ok, location: @member }
        else
          format.html { redirect_to members_url, notice: "Member was successfully updated." }
          format.json { render :show, status: :ok, location: @member }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      if @member.membership_type == "VISITOR" || @member.membership_type == "NEW_SOUL"
        format.html { redirect_to non_member_index_path, notice: "Member was successfully destroyed." }
        format.json { head :no_content }
      else 
        format.html { redirect_to members_url, notice: "Member was successfully destroyed." }
        format.json { head :no_content }
      end 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(
        :name, 
        :email, 
        :birthday, 
        :phone_number, 
        :primary_education, 
        :secondary_education, 
        :above_secondary,
        :twitter_name,
        :facebook_name,
        :phone_number_two,
        :phone_number_three,
        :occupation,
        :telegram_number,
        :phone_number_four,
        :year_joined,
        :whatsapp,
        :membership_type,
        :creation_url,
        :url_creation
      )
    end
end
