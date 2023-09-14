import 'package:mason/mason.dart';

void run(HookContext context) {
  // Read vars.
  final usesRiverpodCodegen = context.vars['codegen'] as bool;
  final usesFreezedCodegen = context.vars['freezed'] as bool;
  final org = context.vars['org'] as String;
  org.validate();

  // Update vars.
  context.vars['anyCodegen'] = usesRiverpodCodegen || usesFreezedCodegen;
  context.vars['reversedOrg'] = org.reversed;
}

extension _PreGenHookUtils on String {
  void validate() {
    final split = this.split('.');
    if (split.length == 1) throw InvalidOrgException(this);

    final regEx = RegExp(r'^([A-Za-z]{1}[A-Za-z\d_]*\.)+[A-Za-z][A-Za-z\d_]*$');
    final isValid = regEx.hasMatch(this);
    if (!isValid) throw InvalidOrgException(this);
  }

  String get reversed => this.split('.').reversed.join('.');
}

class InvalidOrgException implements Exception {
  const InvalidOrgException(this.orgName);
  final String orgName;
  @override
  String toString() => "Invalid org name: $orgName";
}
