import 'package:flutter_ca/features/profile/data/datasources/remote_datasource.dart';
import 'package:flutter_ca/features/profile/data/models/profile_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<RemoteDataSource>()])
import 'remote_datasource_test.mocks.dart';

void main() async {
  // Create mock object.
  var remoteDataSource = MockRemoteDataSource();

  ProfileModel fakeProfileModel = const ProfileModel(
    id: 1,
    email: "rafsan@gmail.com",
    firstName: "Rafsan",
    lastName: "Zaini",
    avatar: "https://www.google.com",
  );
test('Mock Remote Data Source - Berhasil', () async {
  when(remoteDataSource.getUser(1)).thenAnswer(
    (_) async => fakeProfileModel,
  );

  try {
    var response = await remoteDataSource.getUser(1);
    print("Test berhasil");
    print(response.toJson());
    // Validasi hasilnya dengan expect
    expect(response, isA<ProfileModel>());
    expect(response.id, 1);
  } catch (e) {
    print("Terjadi error: $e");
  }
});

  test('Mock Remote Data Source - Gagal', () async {
    when(remoteDataSource.getUser(1))
        .thenThrow(Exception('Failed to load users, status code: 404'));
  
  try {
    var respose = await remoteDataSource.getUser(1);
    print(respose.toJson());
  } catch (e) {
    print(e);
  }
  });
}
