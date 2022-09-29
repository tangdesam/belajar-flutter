import 'club.dart';

class Pertandingan {
  Club home;
  Club away;
  int homeScore;
  int awayScore;
  DateTime date;

  Pertandingan(
      {required this.home,
      required this.away,
      required this.homeScore,
      required this.awayScore,
      required this.date});
}
