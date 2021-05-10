import 'package:registrationform_assignment/views/PersonalInfoPage.dart';

class FormScreenState {
  final bool isBusy;
  final FieldError emailError;
  final FieldError fNameError;
  final FieldError lNameError;
  final bool submissionSuccess;
  FormScreenState({
    this.fNameError,
    this.lNameError,
    this.isBusy: false,
    this.emailError,
    this.submissionSuccess: false,
  });
}