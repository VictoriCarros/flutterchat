import 'package:intl/intl.dart';

extension StringUtils on String {
  get toFormatedDate {
    var teste = DateFormat('yyyy-MM-dd HH:mm').parse(this.replaceAll("T", " "));
    print("date teste - $this, $teste");

    return DateFormat('HH:mm')
        .format(DateTime.parse(this.replaceAll("T", " ")));
  }
}
