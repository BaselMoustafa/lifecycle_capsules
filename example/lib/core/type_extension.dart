extension TypeExtension on Type {
  String get formattedName {
    final input = toString();
    final buffer = StringBuffer();
    for (int i = 0; i < input.length; i++) {
      final char = input[i];
      if (i > 0 && char == char.toUpperCase() && char != char.toLowerCase()) {
        buffer.write(' ');
      }
      buffer.write(char);
    }
    return buffer.toString();
  }
}