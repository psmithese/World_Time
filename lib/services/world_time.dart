import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String? time; //the time in that location
  String? flag; //url an asset flag icon
  String? url; //location url for api endpoint
  bool? isDaytime; // true or false if day time or not

  WorldTime({required this.location, required this.flag, this.url});

  Future<void> getTime() async {
    //make request

    try {
      http.Response response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //get property from data

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      //create Datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Catch error: $e');
      // time = 'Get time data';
    }
  }
}
