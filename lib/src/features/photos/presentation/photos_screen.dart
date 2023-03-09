import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import '../../../common/widgets/fabs_navigation.dart';
import '../../../localization/locale_keys.g.dart';
import '../../../routes/constants.dart';
import '../../../routes/router.dart';
import '../model/photo.dart';
import 'pagination_photo_controller.dart';

class PhotosScreen extends ConsumerWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: const FabsNavigation(),
      appBar: AppBar(
        title: AutoSizeText(LocaleKeys.screens_titles_photos.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () => ref.read(goRouterProvider).go(profileRoute),
          ),
        ],
      ),
      body: RiverPagedBuilder<int, PhotoDto>(
        firstPageKey: 1,
        provider: paginationPhotosControllerProvider,
        itemBuilder: (context, item, index) => ListTile(
          onTap: () {
            ref.read(goRouterProvider).go("$photosRoute/${item.id}");
          },
          leading: AutoSizeText(item.id.toString()),
          title: AutoSizeText(item.title),
        ),
        pagedBuilder: (controller, builder) => PagedListView(
          pagingController: controller,
          builderDelegate: builder,
        ),
      ),
    );
  }
}
