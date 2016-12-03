require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:vladimir)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "FactorOut Account activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@factorout.com"], mail.from
    assert_match user.username,               mail.body.encoded
    assert_match user.activation_token,   mail.body.encoded
    assert_match CGI::escape(user.email), mail.body.encoded
  end

  test "password_reset" do
   user = users(:vladimir)
   user.reset_token = User.new_token
   mail = UserMailer.password_reset(user)
   assert_equal "FactorOut Password reset", mail.subject
   assert_equal [user.email], mail.to
   assert_equal ["noreply@factorout.com"], mail.from
   assert_match user.reset_token,        mail.body.encoded
   assert_match CGI::escape(user.email), mail.body.encoded
  end

end
