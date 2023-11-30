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
part 'authentication_controller.g.dart';
@riverpod
class AuthenticationController extends _$AuthenticationController {
{{/codegen}}
{{^codegen}}
class AuthenticationController extends AutoDisposeNotifier<int> {
{{/codegen}}
  // TODO: customize this as you need
  @override
  bool build() => true;
  bool signin() => state = true;
  bool signout() => state = false;
}

{{^codegen}}
final authenticationControllerProvider = NotifierProvider.autoDispose<AuthenticationController, int>(
  AuthenticationController.new,
);
{{/codegen}}
