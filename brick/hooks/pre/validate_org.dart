void assertValidOrg(String input) {
  final split = input.split('.');
  if (split.length == 1) throw InvalidOrgException(input);

  final regEx = RegExp(r'^([A-Za-z]{1}[A-Za-z\d_]*\.)+[A-Za-z][A-Za-z\d_]*$');
  final isValid = regEx.hasMatch(input);
  if (!isValid) throw InvalidOrgException(input);
}

class InvalidOrgException implements Exception {
  const InvalidOrgException(this.orgName);
  final String orgName;
  @override
  String toString() => 'Invalid org name: $orgName';
}
