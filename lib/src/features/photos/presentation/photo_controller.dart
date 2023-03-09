import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../application/photos_service.dart';
import '../model/photo.dart';
part 'photo_controller.g.dart';

@riverpod
class PhotoController extends _$PhotoController {
  @override
  Future<PhotoDto> build(int id) async {
    final serv = ref.read(photosServiceProvider);
    return await serv.getPhoto(id);
  }
}
