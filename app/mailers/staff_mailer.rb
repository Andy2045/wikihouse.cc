class StaffMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.staff_mailer.proposal.subject
  #

  def enquiry enquiry_id
    @enquiry = Enquiry.find(enquiry_id)
    mail to: "admin@wikihouse.cc",
      reply_to: "#{@enquiry.first_name} #{@enquiry.last_name} <#{@enquiry.email}>",
      subject: "[WikiHouse] #{@enquiry.kind.gsub('-',' ').humanize} enquiry",
      from: "#{@enquiry.first_name} #{@enquiry.last_name} <no-reply@#{ENV.fetch('mailgun_domain')}>"
  end
end
