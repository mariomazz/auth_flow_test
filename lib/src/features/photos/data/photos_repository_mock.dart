import 'package:faker/faker.dart';
import '../model/photo.dart';
import 'photos_repository.dart';

class PhotosRepositoryMock implements PhotosRepositoryInterface {
  PhotosRepositoryMock();
  @override
  Future<PhotoDto> getPhoto(int id,
      {Map<String, dynamic>? queryParameters}) async {
    return await Future.value(
      PhotoDto(
        albumId: faker.randomGenerator.integer(2000),
        id: faker.randomGenerator.integer(2000),
        thumbnailUrl: faker.randomGenerator.string(2000),
        title: faker.person.name(),
        url: faker.randomGenerator.string(2000),
      ),
    );
  }

  @override
  Future<List<PhotoDto>> getPhotos(
      {Map<String, dynamic>? queryParameters}) async {
    return await Future.value(
      List.generate(
        200,
        (index) => PhotoDto(
          albumId: faker.randomGenerator.integer(2000),
          id: faker.randomGenerator.integer(2000),
          thumbnailUrl: 'https://via.placeholder.com/150/92c952',
          title: faker.person.name(),
          url: faker.randomGenerator.string(2000),
        ),
      ),
    );
  }

  @override
  void dispose() {}
}
