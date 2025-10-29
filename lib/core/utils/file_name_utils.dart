import 'package:path/path.dart' as p;

/// Utilities to sanitize and generate unique file/object names for storage.
///
/// These helpers ensure we don't accidentally duplicate extensions and that
/// uploaded objects have safe, filesystem/URL-friendly names.

/// Returns a sanitized base name (without extension).
String sanitizeBaseName(String name) {
  final trimmed = name.trim();
  var sanitized = trimmed.replaceAll(RegExp(r'[^A-Za-z0-9_\-().]'), '_');
  // collapse repeated underscores
  sanitized = sanitized.replaceAll(RegExp(r'_+'), '_');
  return sanitized;
}

/// Build a unique object name for storage using the given [storagePath]
/// and the full [filePath] on disk. The generated name will contain the
/// sanitized base name + an epoch millis suffix + the original extension.
///
/// Example: images/my_file_1633024800000.png
String buildUniqueObjectName(String storagePath, String filePath) {
  final baseName = p.basenameWithoutExtension(filePath);
  final extension = p.extension(filePath).toLowerCase();
  final sanitized = sanitizeBaseName(baseName);
  final uniqueName = '${sanitized}_${DateTime.now().millisecondsSinceEpoch}$extension';

  // Use forward slashes for storage object paths (avoid Windows backslashes).
  final joined = p.join(storagePath, uniqueName).replaceAll('\\', '/');
  return joined;
}
