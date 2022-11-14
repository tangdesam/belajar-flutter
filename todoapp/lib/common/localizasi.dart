class Localizasi {
  static String getFlag(String countryCode) {
    switch(countryCode) {
      case 'en':
        return "${String.fromCharCode(0x1F1FA)}${String.fromCharCode(0x1F1F8)}";
      case 'id':
        return "${String.fromCharCode(0x1F1EE)}${String.fromCharCode(0x1F1E9)}";
      default:
        return "${String.fromCharCode(0x1F1EE)}${String.fromCharCode(0x1F1E9)}";
    }
  }
}