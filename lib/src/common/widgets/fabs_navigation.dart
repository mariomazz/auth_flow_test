import 'package:auth_flow_test/src/common/extensions/widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../localization/locale_keys.g.dart';
import '../../routes/constants.dart';
import '../../routes/router.dart';

class FabsNavigation extends ConsumerWidget {
  const FabsNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          // for wix exception , I/flutter ( 8790): Another exception was thrown: There are multiple heroes that share the same tag within a subtree.
          // https://stackoverflow.com/questions/51125024/there-are-multiple-heroes-that-share-the-same-tag-within-a-subtree
          heroTag: "1",
          child:
              AutoSizeText(LocaleKeys.buttons_titles_go_to_todos_screen.tr()),
          onPressed: () => ref.read(goRouterProvider).go(todosRoute),
        ).padding(const EdgeInsets.symmetric(horizontal: 20)),
        FloatingActionButton(
          heroTag: "2",
          child:
              AutoSizeText(LocaleKeys.buttons_titles_go_to_posts_screen.tr()),
          onPressed: () => ref.read(goRouterProvider).go(postsRoute),
        ).padding(const EdgeInsets.symmetric(horizontal: 20)),
        FloatingActionButton(
          heroTag: "3",
          child:
              AutoSizeText(LocaleKeys.buttons_titles_go_to_photos_screen.tr()),
          onPressed: () => ref.read(goRouterProvider).go(photosRoute),
        ).padding(const EdgeInsets.symmetric(horizontal: 20)),
        FloatingActionButton(
          heroTag: "4",
          child:
              AutoSizeText(LocaleKeys.buttons_titles_go_to_users_screen.tr()),
          onPressed: () => ref.read(goRouterProvider).go(usersRoute),
        ).padding(const EdgeInsets.symmetric(horizontal: 20)),
      ],
    ).padding(const EdgeInsets.symmetric(horizontal: 20));
  }
}
