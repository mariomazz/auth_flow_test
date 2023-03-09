// ignore_for_file: library_private_types_in_public_api

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/widgets/fabs_navigation.dart';
import '../../../localization/locale_keys.g.dart';
import '../../../routes/constants.dart';
import '../../../routes/router.dart';
import 'todos_controller.dart';

class TodosScreen extends ConsumerStatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  TodosScreenState createState() => TodosScreenState();
}

class TodosScreenState extends ConsumerState<TodosScreen> {
  late final todosController = ref.read(todosControllerProvider.notifier);
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  _OrderType iconAppBarState = _OrderType.arrowUp;

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todosControllerProvider);

    return Scaffold(
      floatingActionButton: const FabsNavigation(),
      appBar: AppBar(
        title: AutoSizeText(LocaleKeys.screens_titles_todos.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () => ref.read(goRouterProvider).go(profileRoute),
          ),
          IconButton(
            icon: Icon(
              iconAppBarState == _OrderType.arrowUp
                  ? Icons.keyboard_arrow_up
                  : iconAppBarState == _OrderType.arrowDown
                      ? Icons.keyboard_arrow_down
                      : Icons.dehaze,
            ),
            onPressed: () async {
              if (iconAppBarState == _OrderType.arrowUp) {
                iconAppBarState = _OrderType.arrowDown;
              } else {
                iconAppBarState = _OrderType.arrowUp;
              }
              await todosController.didFilterChange(
                  ascending: iconAppBarState == _OrderType.arrowUp);
            },
          ),
        ],
      ),
      body: todos.when(
        data: (todos) {
          return RefreshIndicator(
            onRefresh: () async {
              await todosController.didFilterChange(
                  ascending: iconAppBarState == _OrderType.arrowUp);
            },
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final e = todos.elementAt(index);
                return ListTile(
                  onTap: () {
                    ref.read(goRouterProvider).go("$todosRoute/${e.id}");
                  },
                  title: AutoSizeText(e.title),
                  subtitle: AutoSizeText("${e.completed}"),
                  leading: AutoSizeText(e.userId.toString()),
                  trailing: AutoSizeText(e.userId.toString()),
                );
              },
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

enum _OrderType {
  arrowUp,
  arrowDown,
}
