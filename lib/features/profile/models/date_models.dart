class DateModels {
  final int id;
  final String day;
  final List<TimesModels> times;
  final String reservation;
  final bool isReservation;

  DateModels( {
    required this.id,
    required this.day,
    required this.times,
    required this.reservation,
    required this.isReservation,
  });
}

class TimesModels {
  final int id;
  final String time;

  TimesModels({
    required this.id,
    required this.time,
  });
}
