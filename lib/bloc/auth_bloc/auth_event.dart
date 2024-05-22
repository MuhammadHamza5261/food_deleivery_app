abstract class AuthEvent{}

// sign up
class SignUpDataEvent extends AuthEvent{

  String email;
  String password;

  SignUpDataEvent({
    required this.email,
    required this.password,
});


}

// sign in

class SignInDataEvent extends AuthEvent{

  final String email;
  final String password;

  SignInDataEvent({required this.email,required this.password});

}

// forgot password

class ForgotDataEvent extends AuthEvent{

  final String forgotPassword;
  ForgotDataEvent({required this.forgotPassword});

}