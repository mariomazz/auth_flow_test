import 'package:auth_flow_test/src/common/extensions/widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/widgets/fabs_navigation.dart';
import '../../../localization/locale_keys.g.dart';
import 'users_controller.dart';

class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUsers = ref.watch(usersControllerProvider);
    return Scaffold(
      floatingActionButton: const FabsNavigation(),
      appBar: AppBar(title: AutoSizeText(LocaleKeys.screens_titles_users.tr())),
      body: asyncUsers.when(
        data: (users) {
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (ctx, i) {
              final user = users.elementAt(i);
              return ListTile(
                onTap: () {},
                title: AutoSizeText(user.name),
              );
            },
          );
        },
        error: (err, stacktrace) {
          return AutoSizeText(LocaleKeys.errors_messages_default.tr()).center();
        },
        loading: () {
          return const CircularProgressIndicator().center();
        },
      ),
    );
  }
}
