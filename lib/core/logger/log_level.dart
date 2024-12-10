class LogLevel {
  const LogLevel(this.name, this.value);

  final String name;
  final int value;

  /// The lowest possible value
  static const LogLevel all = LogLevel('ALL', 0);

  /// The highest possible value
  static const LogLevel off = LogLevel('OFF', 2000);

  /// Use [trace] for something that is completely useless, except for when you need to debug.
  static const LogLevel trace = LogLevel('INFO', 200);

  /// Use [info] if you want to inform the developer that something has been done.
  static const LogLevel info = LogLevel('INFO', 500);

  /// Use [warn] when there is an error, but we can recover and move on without any further complications.
  static const LogLevel warn = LogLevel('WARN', 600);

  /// Use [severe] when there is an error and parts of the program won't work properly anymore.
  static const LogLevel severe = LogLevel('SEVERE', 700);

  /// Use [fatal] when there is an error so bad that the entire program doesn't work properly anymore and it needs to be stopped.
  static const LogLevel fatal = LogLevel('FATAL', 1000);
}
