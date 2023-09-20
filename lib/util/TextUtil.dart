class TextUtil {
  static bool isEmpty(String? string) {
    if ((string == null) || (string.isEmpty) || (string == "null")) {
      return true;
    }
    return false;
  }
}
