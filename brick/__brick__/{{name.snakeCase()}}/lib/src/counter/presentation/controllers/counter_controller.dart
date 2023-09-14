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
part 'counter_controller.g.dart';
@riverpod
class CounterController extends _$CounterController {
{{/codegen}}
{{^codegen}}
class CounterController extends AutoDisposeNotifier<int> {
{{/codegen}}
  @override
  int build() => 0;
  void increment() => state++;
  void decrement() => state--;
}

{{^codegen}}
final counterControllerProvider = NotifierProvider.autoDispose<CounterController, int>(
  CounterController.new,
);
{{/codegen}}
