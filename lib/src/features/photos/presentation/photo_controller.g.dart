// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$photoControllerHash() => r'9c62ce80ae32ea4548bc59f794acea228ba8d217';

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

abstract class _$PhotoController
    extends BuildlessAutoDisposeAsyncNotifier<PhotoDto> {
  late final int id;

  Future<PhotoDto> build(
    int id,
  );
}

/// See also [PhotoController].
@ProviderFor(PhotoController)
const photoControllerProvider = PhotoControllerFamily();

/// See also [PhotoController].
class PhotoControllerFamily extends Family<AsyncValue<PhotoDto>> {
  /// See also [PhotoController].
  const PhotoControllerFamily();

  /// See also [PhotoController].
  PhotoControllerProvider call(
    int id,
  ) {
    return PhotoControllerProvider(
      id,
    );
  }

  @override
  PhotoControllerProvider getProviderOverride(
    covariant PhotoControllerProvider provider,
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
  String? get name => r'photoControllerProvider';
}

/// See also [PhotoController].
class PhotoControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PhotoController, PhotoDto> {
  /// See also [PhotoController].
  PhotoControllerProvider(
    this.id,
  ) : super.internal(
          () => PhotoController()..id = id,
          from: photoControllerProvider,
          name: r'photoControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$photoControllerHash,
          dependencies: PhotoControllerFamily._dependencies,
          allTransitiveDependencies:
              PhotoControllerFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is PhotoControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<PhotoDto> runNotifierBuild(
    covariant PhotoController notifier,
  ) {
    return notifier.build(
      id,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
