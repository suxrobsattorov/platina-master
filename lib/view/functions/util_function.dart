class UtilFunction {
  String beforeTime(String date) {
    List<String> a1 = date.split(' ');
    List<String> a2 = a1[0].split('-');
    List<String> a3 = a1[1].split('.');
    List<String> a4 = a3[0].split(':');

    String dateTimeNow = DateTime.now().toString();

    List<String> b1 = dateTimeNow.split(' ');
    List<String> b2 = b1[0].split('-');
    List<String> b3 = b1[1].split('.');
    List<String> b4 = b3[0].split(':');

    int year = int.parse(b2[0]) - int.parse(a2[0]);
    int month = int.parse(b2[1]) - int.parse(a2[1]);
    int day = int.parse(b2[2]) - int.parse(a2[2]);

    int hour = int.parse(b4[0]) - int.parse(a4[0]);
    int minute = int.parse(b4[1]) - int.parse(a4[1]);
    int second = int.parse(b4[2]) - int.parse(a4[2]);

    if (year != 0) {
      return '$year yil avval';
    } else if (month != 0) {
      return '$month oy avval';
    } else if (day != 0) {
      return '$day kun avval';
    } else if (hour != 0) {
      return '$hour soat avval';
    } else if (minute != 0) {
      return '$minute daqiqa avval';
    } else if (second != 0) {
      return '$second sekund avval';
    }

    return '';
  }

  String replaceTitle(String title) {
    return title
        .replaceAll('Ê»', '\'')
        .replaceAll('â', '“')
        .replaceAll('â', '”')
        .replaceAll('â', '-')
        .replaceAll('Ê¼', '\'');
  }
}
