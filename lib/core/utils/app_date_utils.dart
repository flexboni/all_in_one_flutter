class AppDateUtils {
  const AppDateUtils._();

  static convertDurationToMMSS(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");

    return '${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds % 60)}';
  }
}
