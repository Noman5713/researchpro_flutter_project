//return formatted date and time
String formatDate(DateTime dateTime) {
  //get year
  String year = dateTime.year.toString();

  //get month
  String month = dateTime.month.toString();

  //get day
  String day = dateTime.day.toString();

  //final formatted date
  String formattedData = '$day/$month/$year';

  return formattedData;
}
