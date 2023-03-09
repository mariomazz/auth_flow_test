import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../localization/locale_keys.g.dart';
import 'photo_controller.dart';

class PhotoDetailScreen extends ConsumerWidget {
  final int photoId;
  const PhotoDetailScreen({
    super.key,
    required this.photoId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPhoto = ref.watch(photoControllerProvider(photoId));
    return Scaffold(
      appBar: AppBar(
          title: AutoSizeText(LocaleKeys.screens_titles_photo_detail.tr())),
      body: asyncPhoto.when(
        data: (photo) {
          return Center(
            child: ListTile(
              title: AutoSizeText(photo.title),
              subtitle: SizedBox(
                height: 150,
                width: 150,
                child: CachedNetworkImage(imageUrl: photo.thumbnailUrl),
              ),
              leading: AutoSizeText(photo.id.toString()),
              trailing: AutoSizeText(photo.albumId.toString()),
            ),
          );
        },
        error: (err, stacktrace) {
          return Center(
              child: AutoSizeText(LocaleKeys.errors_messages_default.tr()));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
