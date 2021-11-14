
extension stringExtensions on String {
  String capitalizeFirstLiter() {
    String s = '';
    List<String> words = this.trim().split(' ');

    for(String word in words) {
      word = '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
      s = s + ' ' + word;
    }

    return s;
  }
}