import 'package:registrationform_assignment/Dao/UsersDao.dart';
import 'package:registrationform_assignment/Models/Users.dart';

class UsersRepository
{
  final UsersDao usersDao=UsersDao();

  Future getAllUsers({String query})=>usersDao.getUsers(query:query);

  Future insertUsers({Users users})=>usersDao.createUsers(users);

  

}