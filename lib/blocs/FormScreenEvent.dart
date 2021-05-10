abstract class FormScreenEvent {}

class FormScreenEventSubmit extends FormScreenEvent {
  final String fName,lName,email;
  FormScreenEventSubmit(this.email, this.fName, this.lName);
}