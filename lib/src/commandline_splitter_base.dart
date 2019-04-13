/// Splits given [command] into a list of individual parts suitable for using
/// with Process.start or Process.run.
///
/// Example:
///     split("""bash -c "uname -a" """); => [bash, -c, "uname -a"]
List<String> split(String command) {
  final ret = <String>[];
  command = command.trim();
  while (command.isNotEmpty) {
    RegExp regexp = RegExp(r"""[^'"-\s]+""");

    if (command[0] == '-') {
      regexp = RegExp(r"""--?[^'"-\s]+""");
    } else if (command[0] == "'") {
      regexp = RegExp(r"""'[^']+'""");
    } else if (command[0] == '"') {
      regexp = RegExp(r'''"[^"]+"''');
    }

    final match = regexp.matchAsPrefix(command);
    if (match != null) {
      String part = command.substring(match.start, match.end);
      ret.add(part);
      command = command.substring(match.end).trim();
    } else {
      throw Exception("Cannot parse $command");
    }
  }
  return ret;
}
