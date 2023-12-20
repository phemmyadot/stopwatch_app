String getFormattedTime(int timeInSeconds) {
  int hours = (timeInSeconds ~/ 3600) % 12;
  int minutes = (timeInSeconds ~/ 60) % 60;
  int seconds = timeInSeconds % 60;
  return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}
