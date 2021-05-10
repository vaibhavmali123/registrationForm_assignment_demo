import 'dart:async';

import 'package:registrationform_assignment/Models/Users.dart';
import 'package:registrationform_assignment/Repository/UsersRepository.dart';

class UsersBloc
{
  final userRepository=UsersRepository();

  final userController=StreamController<List<Users>>.broadcast();

  get usersList => userController.stream;

  UsersBloc(){
    getUsers();
  }

   getUsers({String query}) async{
    userController.sink.add(await userRepository.getAllUsers(query:query));
  }


  addUsers(Users users)async{
    await userRepository.insertUsers(users:users);
  }

}