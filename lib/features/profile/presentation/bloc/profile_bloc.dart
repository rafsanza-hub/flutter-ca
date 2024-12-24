import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ca/features/profile/domain/entities/profile.dart';
import 'package:flutter_ca/features/profile/domain/usecases/get_all_user.dart';
import 'package:flutter_ca/features/profile/domain/usecases/get_user.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  GetAllUser getAllUser;
  GetUser getUser;
  ProfileBloc(this.getAllUser, this.getUser) : super(ProfileStateEmpty()) {
    on<ProfileEventGetAllUser>((event, emit) {});
    on<ProfileEventGetDetailUser>((event, emit) {});
  }
}
