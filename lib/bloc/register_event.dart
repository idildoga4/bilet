abstract class RegisterEvent{
  const RegisterEvent();
}

class UserNameChanged extends RegisterEvent{
  final String  username;
  const UserNameChanged(this.username);
}

class EmailChanged extends RegisterEvent{
  final String email;
  const EmailChanged(this.email);
}

class PasswordChanged extends RegisterEvent{
  final String password;
  const PasswordChanged(this.password);
}

class rePasswordChanged extends RegisterEvent{
  final String rePassword;
  const rePasswordChanged(this.rePassword);
}
