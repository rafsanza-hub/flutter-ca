import 'package:dartz/dartz.dart';
import 'package:flutter_ca/core/error/failure.dart';
import 'package:flutter_ca/features/profile/data/datasources/local_datasource.dart';
import 'package:flutter_ca/features/profile/data/datasources/remote_datasource.dart';
import 'package:flutter_ca/features/profile/data/models/profile_model.dart';
import 'package:flutter_ca/features/profile/domain/entities/Profile.dart';
import 'package:flutter_ca/features/profile/domain/repositories/profile_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive/hive.dart';

class ProfileRepositoryImplementation implements ProfileRepository {
  LocalDatasource localDatasource;
  RemoteDataSource remoteDataSource;
  HiveInterface hive;


  ProfileRepositoryImplementation(
      {required this.localDatasource, required this.remoteDataSource, required this.hive});

  @override
  Future<Either<Failure, List<Profile>>> getAllUser(int page) async {
    try {
      final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      List<ProfileModel> result = await localDatasource.getAllUser(page);
      return Right(result.map((profileModel) => profileModel as Profile).toList());
    } else{
      List<ProfileModel> result = await remoteDataSource.getAllUser(page);
      var box = hive.box("profile_box");
      box.put("getallUser", result);
      return Right(result.map((profileModel) => profileModel as Profile).toList());
    }
    } catch (e) {
      return Left(Failure());
    
    }
    
  }

  @override
  Future<Either<Failure, Profile>> getUser(int id) async {
    try {
      final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      ProfileModel result = await localDatasource.getUser(id);
      return Right(result as Profile);
    } else{
      ProfileModel result = await remoteDataSource.getUser(id);
      var box = hive.box("profile_box");
      box.put("getUser", result);
      return Right(result as Profile);
    }
    } catch (e) {
      return Left(Failure());
      
    }
  }
}
