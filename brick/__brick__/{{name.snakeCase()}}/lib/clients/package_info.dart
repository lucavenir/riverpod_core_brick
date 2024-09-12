import 'package:package_info_plus/package_info_plus.dart';

{{#codegen}}
import 'package:riverpod_annotation/riverpod_annotation.dart';
{{/codegen}}
{{^codegen}}
{{#hooks}}
import 'package:hooks_riverpod/hooks_riverpod.dart';
{{/hooks}}
{{^hooks}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
{{/hooks}}
{{/codegen}}


{{#codegen}}
part 'package_info.g.dart';
@riverpod
FutureOr<PackageInfo> packageInfo(PackageInfoRef ref) {
{{/codegen}}
{{^codegen}}
final packageInfoProvider = FutureProvider.autoDispose<PackageInfo>((ref) {
{{/codegen}}

 return PackageInfo.fromPlatform();

{{#codegen}}
}
{{/codegen}}
{{^codegen}}
});
{{/codegen}}
