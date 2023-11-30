import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart';
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
import 'package:talker_flutter/talker_flutter.dart';

{{#codegen}}
part 'talker.g.dart';
@riverpod
Talker talker(TalkerRef ref) {
{{/codegen}}
{{^codegen}}
final talkerProvider = Provider.autoDispose<Talker>((ref) {
{{/codegen}}
  throw UnimplementedError("This provider is meant to be overridden");
{{#codegen}}
}
{{/codegen}}
{{^codegen}}
});
{{/codegen}}