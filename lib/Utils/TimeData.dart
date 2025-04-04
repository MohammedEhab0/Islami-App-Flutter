class TimeData {
  static List<PrayTime> prayTimeList = [
    PrayTime(prayName: 'Fagr', prayClock: '4:38', AmOrPm: 'AM'),
    PrayTime(prayName: 'Dhuhr', prayClock: '01:01', AmOrPm: 'PM'),
    PrayTime(prayName: 'Asr', prayClock: '4:38', AmOrPm: 'PM'),
    PrayTime(prayName: 'Maghrib', prayClock: '07:57', AmOrPm: 'PM'),
    PrayTime(prayName: 'Isha', prayClock: '09:57', AmOrPm: 'PM')
  ];
}

class PrayTime {
  String prayName;

  String prayClock;
  String AmOrPm;

  PrayTime(
      {required this.prayName, required this.prayClock, required this.AmOrPm});
}
