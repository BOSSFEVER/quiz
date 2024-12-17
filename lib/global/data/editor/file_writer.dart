import 'dart:convert';
import 'dart:io';

class FileWriter {
  FileWriter(this._path) {
    _dir = Directory(_path);
    if (!_dir.existsSync()) {
      _dir.create();
    }
  }

  final String _path;
  late final Directory _dir;
  final _encoder = JsonEncoder.withIndent('  ');
  final _decoder = JsonDecoder();

  void writeMetadata(Map<String, dynamic> data) {
    final File file = File('$_path.game');
    file.writeAsStringSync(_encoder.convert(data));
  }

  void writeGame(String game, Map<String, dynamic> data) {
    final File file = File('$_path$game.game');
    file.writeAsStringSync(_encoder.convert(data));
  }

  void readMetadata() {}
}
