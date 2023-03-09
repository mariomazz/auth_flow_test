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
import '../model/post.dart';
import 'pagination_posts_controller.dart';

class PostsScreen extends ConsumerWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(LocaleKeys.screens_titles_posts.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () => ref.read(goRouterProvider).go(profileRoute),
          ),
        ],
      ),
      floatingActionButton: const FabsNavigation(),
      body: RiverPagedBuilder<int, PostDto>(
        firstPageKey: 1,
        provider: paginationPostsControllerProvider,
        itemBuilder: (context, item, index) => ListTile(
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
