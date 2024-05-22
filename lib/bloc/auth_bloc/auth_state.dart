abstract class AuthState{}

// Sign Up

class SignUpInitialState extends AuthState{}

class SignUpProgressState extends AuthState{}

class SignUpDataIsLoadedState extends AuthState{}

class SignUpErrorState extends AuthState{

  final String errorMessage;
  SignUpErrorState(this.errorMessage);

}


// Sign In
class SignInProgressState extends AuthState{}

class SignInDataIsLoadedState extends AuthState{}

class SignInErrorState extends AuthState{

  final String errorMessage;
  SignInErrorState(this.errorMessage);

}

// forgot password

class ForgotPasswordProgressState extends AuthState{}

class ForgotDataIsLoadedState extends AuthState{}

class ForgotErrorState extends AuthState{

  final String errorMessage;
  ForgotErrorState(this.errorMessage);

}

