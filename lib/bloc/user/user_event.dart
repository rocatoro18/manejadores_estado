part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUserEvent extends UserEvent {
  final Usuario user;
  ActivateUserEvent(this.user);
}

class ChangeUserAgeEvent extends UserEvent {
  final int age;
  ChangeUserAgeEvent(this.age);
}

class AddProfession extends UserEvent {
  final String profession;
  AddProfession(this.profession);
}

class DeleteUserEvent extends UserEvent {}
