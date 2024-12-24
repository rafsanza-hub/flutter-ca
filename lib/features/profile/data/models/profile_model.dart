import '../../domain/entities/profile.dart';

class ProfileModel extends Profile {
  final String firstName;
  final String lastName;

  const ProfileModel(
      {required super.id,
      required super.email,
      required this.firstName,
      required this.lastName,
      required super.avatar})
      : super(
          fullname: "$firstName $lastName",
        );

  factory ProfileModel.fromJson(Map<String, dynamic> json) {


    Map<String, dynamic> data = json;
    return ProfileModel(
        id: data["id"],
        email: data["email"],
        firstName: data["first_name"],
        lastName: data["last_name"],
        avatar: data["avatar"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "avatar": avatar
    };
  }
  test(){
    return "test";
  }

  static List<ProfileModel> fromJsonList(List<dynamic> json) {
    if (json.isEmpty) return [];
    return json.map((data) => ProfileModel.fromJson(data)).toList();
  }
}
