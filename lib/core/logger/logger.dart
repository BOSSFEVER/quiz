import 'dart:developer' as developer;

import 'package:quiz/core/logger/log_level.dart';

class Logger {
  const Logger(this.name);

  final String name;

  void _log(int level, String message, {Error? error, StackTrace? stackTrace}) {
    developer.log(message, name: name, level: level, error: error, stackTrace: stackTrace);
  }

  /// Use [trace] for something that is completely useless, except for when you need to debug.
  void trace(String message, {Error? error, StackTrace? stackTrace}) {
    _log(LogLevel.trace.value, message, error: error, stackTrace: stackTrace);
  }

  /// Use [info] if you want to inform the developer that something has been done.
  void info(String message, {Error? error, StackTrace? stackTrace}) {
    _log(LogLevel.info.value, message, error: error, stackTrace: stackTrace);
  }

  /// Use [warn] when there is an error, but we can recover and move on without any further complications.
  void warn(String message, {Error? error, StackTrace? stackTrace}) {
    _log(LogLevel.warn.value, message, error: error, stackTrace: stackTrace);
  }

  /// Use [severe] when there is an error and parts of the program won't work properly anymore.
  void severe(String message, {Error? error, StackTrace? stackTrace}) {
    _log(LogLevel.severe.value, message, error: error, stackTrace: stackTrace);
  }

  /// Use [fatal] when there is an error so bad that the entire program doesn't work properly anymore and it needs to be stopped.
  void fatal(String message, {Error? error, StackTrace? stackTrace}) {
    _log(LogLevel.fatal.value, message, error: error, stackTrace: stackTrace);
  }
}
