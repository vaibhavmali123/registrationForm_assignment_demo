import 'package:flutter/cupertino.dart';
import 'package:registrationform_assignment/Models/Users.dart';

class InheritedDataProvider extends InheritedWidget{

final Users users;


InheritedDataProvider({
  Widget child,
  this.users,
}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedDataProvider oldWidget) => users != oldWidget.users;

static InheritedDataProvider of(BuildContext context) =>
    context.inheritFromWidgetOfExactType(InheritedDataProvider);

}