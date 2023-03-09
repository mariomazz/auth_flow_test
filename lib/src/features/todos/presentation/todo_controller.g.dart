// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoControllerHash() => r'c876d556892437383dcb1df95b41b4aaa42b2ae8';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TodoController
    extends BuildlessAutoDisposeAsyncNotifier<TodoDto> {
  late final int id;

  FutureOr<TodoDto> build(
    int id,
  );
}

/// See also [TodoController].
@ProviderFor(TodoController)
const todoControllerProvider = TodoControllerFamily();

/// See also [TodoController].
class TodoControllerFamily extends Family<AsyncValue<TodoDto>> {
  /// See also [TodoController].
  const TodoControllerFamily();

  /// See also [TodoController].
  TodoControllerProvider call(
    int id,
  ) {
    return TodoControllerProvider(
      id,
    );
  }

  @override
  TodoControllerProvider getProviderOverride(
    covariant TodoControllerProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'todoControllerProvider';
}

/// See also [TodoController].
class TodoControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TodoController, TodoDto> {
  /// See also [TodoController].
  TodoControllerProvider(
    this.id,
  ) : super.internal(
          () => TodoController()..id = id,
          from: todoControllerProvider,
          name: r'todoControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$todoControllerHash,
          dependencies: TodoControllerFamily._dependencies,
          allTransitiveDependencies:
              TodoControllerFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is TodoControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<TodoDto> runNotifierBuild(
    covariant TodoController notifier,
  ) {
    return notifier.build(
      id,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
