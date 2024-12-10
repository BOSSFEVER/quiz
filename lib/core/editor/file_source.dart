class FileSource {
  String? path;

  void open(String path) async {
    this.path = path;
  }

  void getAssets() {}

  void addAsset() {}

  void getGameList() {}

  void updateMetadata() {}

  void updateGame() {}

  void createGame() {}

  void removeGame() {}

  void reset() {
    path = null;
  }
}
