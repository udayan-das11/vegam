class UserMailer < ApplicationMailer
  default from: "vegamcorp@gmail.com"

  def booking_email(booking)
     @booking = booking
    mail(to: @booking.email, subject: 'Sample Email')
  end
end
