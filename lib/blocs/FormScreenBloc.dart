import 'package:registrationform_assignment/blocs/FormScreenEvent.dart';
import 'package:registrationform_assignment/blocs/FormScreenState.dart';
import 'package:registrationform_assignment/blocs/ValidationMixin.dart';
import 'package:bloc/bloc.dart';
import 'package:registrationform_assignment/views/PersonalInfoPage.dart';
class FormScreenBloc extends Bloc<FormScreenEvent, FormScreenState>
    with ValidationMixin {
  FormScreenBloc() : super();

  @override
  FormScreenState get initialState => FormScreenState();

  @override
  Stream<FormScreenState> mapEventToState(FormScreenEvent event) async* {
    if (event is FormScreenEventSubmit) {
      yield FormScreenState(isBusy: true);

      if (this.isFieldEmpty(event.email)) {
        yield FormScreenState(emailError: FieldError.Empty);
        return;
      }

      else if (!this.validateEmailAddress(event.email)) {
        yield FormScreenState(emailError: FieldError.Invalid);
        return;
      }

      else if (!this.isFieldFnameEmpty(event.fName)) {
        yield FormScreenState(fNameError:FieldError.Empty);
        return;
      }
      else if (!this.isFieldEmpty(event.lName)) {
        yield FormScreenState(lNameError:FieldError.Empty);
        return;
      }
      else{
        yield FormScreenState(submissionSuccess: true);
      }
    }
  }
}