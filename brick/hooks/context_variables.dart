import 'package:mason/mason.dart';

extension RiverpodCoreContextExt on HookContext {
  String get name => extract('name');
  String get description => extract('description');
  String get org => extract('org');
  String get reversedOrg => extract('reversedOrg');
  bool get codegen => extract('codegen');
  bool get freezed => extract('freezed');
  bool get anyCodegen => extract('anyCodegen');
  bool get isCrossPlatform => extract('isCrossPlatform');
  String get formattedPlatforms => extract('formattedPlatforms');
  bool get hasIOs => extract('hasIOs');
  bool get hasAndroid => extract('hasAndroid');
  bool get hasMacOs => extract('hasMacOs');
  bool get hasWindows => extract('hasWindows');
  bool get hasWeb => extract('hasWeb');
  bool get hasLinux => extract('hasLinux');
  bool get hasFlavoring => extract('flavorizr');
  bool get hooks => extract('hooks');
  String get mainFlavor => extract('mainFlavor');

  List<Object> get platforms => extractList('platforms');
  List<Map<String, String>> get otherFlavors => extractList('otherFlavors');
  List<Object?> get flavors => extractList('flavors');

  List<T> extractList<T>(String varName) {
    if (!vars.containsKey(varName)) throw MissingContextVarException(varName);
    return (vars[varName] as List<Object?>).cast<T>();
  }

  T extract<T>(String varName) {
    if (!vars.containsKey(varName)) throw MissingContextVarException(varName);
    return vars[varName] as T;
  }
}

class MissingContextVarException implements Exception {
  MissingContextVarException(this.varName);
  final String varName;

  @override
  String toString() => 'Context variable $varName not found';
}
