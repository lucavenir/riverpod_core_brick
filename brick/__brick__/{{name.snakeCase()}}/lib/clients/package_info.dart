import 'package:package_info_plus/package_info_plus.dart';

{{#codegen}}
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_info.g.dart';

@riverpod
PackageInfo packageInfo(PackageInfoRef ref) {
  throw UnimplementedError('This provider is meant to be overridden');
}
{{/codegen}}
{{^codegen}}
{{#hooks}}
import 'package:hooks_riverpod/hooks_riverpod.dart';
{{/hooks}}
{{^hooks}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
{{/hooks}}
final packageInfoProvider = Provider.autoDispose<PackageInfo>((ref) {
  throw UnimplementedError('This provider is meant to be overridden');
});
{{/codegen}}
