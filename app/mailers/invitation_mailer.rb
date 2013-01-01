class InvitationMailer < ActionMailer::Base
  default from: "notice@leangild.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.invitation_notice.subject
  #
  def invitation_notice(invitation)
    @invitation = invitation

    mail to: invitation.user.email, subject: "Invitation Notice"
  end
end
