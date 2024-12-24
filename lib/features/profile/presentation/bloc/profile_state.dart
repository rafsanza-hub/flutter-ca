part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();  

  
}
class ProfileStateEmpty extends ProfileState {

  @override
  List<Object> get props => [];
  
}

class ProfileStateLoading extends ProfileState {

  @override
  List<Object> get props => [];
  
}

class ProfileStateError extends ProfileState {
  final String message;
  const ProfileStateError(this.message);

  @override
  List<Object> get props => [message]; 
}

class ProfileStateAllUser extends ProfileState {
  final List<Profile> users;
  const ProfileStateAllUser(this.users);

  @override
  List<Object> get props => [users]; 
}

class ProfileStateDetailUser extends ProfileState {
  final Profile user;
  const ProfileStateDetailUser(this.user);

  @override
  List<Object> get props => [user]; 
}