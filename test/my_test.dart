
import 'package:flutter_ca/features/profile/data/datasources/remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

RemoteDataSourceImpl remoteDataSource = RemoteDataSourceImpl();

void main() {
  test('Get All User', () async {
    final result = await remoteDataSource.getAllUser(1);
    expect(result.length, 6);
    print(result);
  });

  test('Get User', () async {
    final result = await remoteDataSource.getUser(1);
    expect(result.id, 1);
    print(result);
  });
}