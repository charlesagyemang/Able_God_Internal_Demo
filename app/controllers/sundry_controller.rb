class SundryController < ApplicationController

  def add_new_member
    @member = Member.new
  end

  def member_created_successfully
    @name = params[:name]
  end

  def new_member_qr
    @qrcode = RQRCode::QRCode.new(sundry_add_new_member_url)
    @svg = @qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 8,
      standalone: true,
      use_path: true
    )
  end
  

end
