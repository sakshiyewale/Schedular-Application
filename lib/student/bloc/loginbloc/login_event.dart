abstract class LoginEvent {}

class LoginSuccesfulEvent extends LoginEvent {}

class LoginUnSuccesfulEvent extends LoginEvent{}

class LoginValidationEvent extends LoginEvent
{
   String username;
   String password;
   LoginValidationEvent( this.username , this.password);
}