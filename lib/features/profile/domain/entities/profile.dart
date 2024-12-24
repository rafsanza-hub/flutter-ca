import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final int id;
  final String email;
  final String fullname;
  final String avatar;

  const Profile(
      {required this.id,
      required this.email,
      required this.fullname,
      required this.avatar});

  @override
  List<Object> get props {
    return [
      id,
      email,
      fullname,
      avatar,
    ];
  }
}
