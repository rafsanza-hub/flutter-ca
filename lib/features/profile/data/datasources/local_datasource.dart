import '../models/profile_model.dart';
import 'package:hive/hive.dart';

abstract class LocalDatasource {
  Future<List<ProfileModel>> getAllUser(int page);
  Future<ProfileModel> getUser(int id);
}

class LocalDatasourceImpl implements LocalDatasource {
  HiveInterface hive = Hive;
  @override
  Future<List<ProfileModel>> getAllUser(int page) {
    var box = hive.box("profile_box");
    return box.get("getallUser");
  }

  @override
  Future<ProfileModel> getUser(int id) {
    var box = hive.box("profile_box");
    return box.get("getUser");
  }
}
