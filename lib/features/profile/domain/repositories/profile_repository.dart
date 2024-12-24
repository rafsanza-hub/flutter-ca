import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/Profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, List<Profile>>> getAllUser(int page);
  Future<Either<Failure, Profile>> getUser(int id);
}
