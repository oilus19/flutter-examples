String getWeekName(DateTime date) {
  int weekNum = date.weekday;

  switch (weekNum) {
    case 1:
      return "Monday";
    case 2:
      return "Tuesday";
    case 3:
      return "Wednesday";
    case 4:
      return "Thursday";
    case 5:
      return "Friday";
    case 6:
      return "Satursday";
    case 7:
      return "Sunday";
    default:
      return "Monday";
  }
}