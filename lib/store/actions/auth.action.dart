class LoginPending{
  LoginPending (this.email, this.password);
  String email;
  String password;
}
class LoginSuccess{}
class LoginError{}



class SignUpPending{
  SignUpPending(this.login,this.email,this.password);
  String login;
  String email;
  String password;
}
class SignUpSuccess{}
class SignUpError{}