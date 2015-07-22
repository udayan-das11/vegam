class WorkerMailer < ApplicationMailer
default from: "vegamcorp@gmail.com"

  def work_email(worker , booking)
     @worker = worker
    mail(to: @worker.email, subject: 'Worker Mail')
  end

end
