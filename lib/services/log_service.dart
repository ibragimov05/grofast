import 'package:logger/logger.dart';

final class LogService {
  const LogService._();

  static final Logger _logger = Logger(printer: PrettyPrinter());

  /// Log debug messages
  static void d(String message) => _logger.d(message);

  /// Log informational messages
  static void i(String message) => _logger.i(message);

  /// Log warning messages
  static void w(String message) => _logger.w(message);

  /// Log error messages with optional stack trace
  static void e(String message, [StackTrace? stackTrace]) =>
      _logger.e(message, stackTrace: stackTrace);

  /// Log fatal messages with optional stack trace
  static void f(String message, [StackTrace? stackTrace]) =>
      _logger.f(message, stackTrace: stackTrace);

  /// Log trace messages with optional stack trace
  static void t(String message, [StackTrace? stackTrace]) =>
      _logger.t(message, stackTrace: stackTrace);
}
