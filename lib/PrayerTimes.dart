import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';



class PrayerTimes extends StatefulWidget {
  const PrayerTimes({Key? key}) : super(key: key);

  @override
  State<PrayerTimes> createState() => _PrayerTimesState();
}

DateTime now = DateTime.now();
//String formattedDate = DateFormat('yyyy-MM-dd').format(now);



var format = DateFormat.yMMMMEEEEd('ta');
var tamilDate = format.format(DateTime.now());



class _PrayerTimesState extends State<PrayerTimes> {

  List _prayerTimes = [];

 String monthNow =  now.month.toString();
 String dayNow = now.day.toString();

 int indexDayNow = now.day.toInt() - 1;




  String FajrTime = "00.00";
  String SunriseTime = "00.00";
  String DhuhrTime = "00.00";
  String AsrTime = "00.00";
  String MaghribTime = "00.00";
  String IshaTime = "00.00";


  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/prayer_times.json');
    final data = await json.decode(response);
    setState(() {
      //_prayerTimes = data["prayer_times"];
      _prayerTimes = data["$monthNow"];


      FajrTime = _prayerTimes[indexDayNow]["Fajr"];

      SunriseTime = _prayerTimes[indexDayNow]["Sunrise"];
      DhuhrTime = _prayerTimes[indexDayNow]["Dhuhr"];
      AsrTime = _prayerTimes[indexDayNow]["Asr"];
      MaghribTime = _prayerTimes[indexDayNow]["Maghrib"];
      IshaTime = _prayerTimes[indexDayNow]["Isha"];

    });
  }




    //set to AM/PM





  TextStyle PrayerTimeFont = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 25,
    color: Colors.black,
    fontFamily: 'AnekTamil',
  );




  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ta');


    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage( image: AssetImage("assets/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
      
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                 Text(' $tamilDate',
                    style: TextStyle(
                      fontFamily: 'AnekTamil',
                      fontSize: 25.0,
                      fontWeight: FontWeight.normal,
                    )),

              ],
            ),
            SizedBox(height: 50),
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      'ஃபஜ்ர் -',
                      style: PrayerTimeFont,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'சூரிய உதயம் -',
                      style: PrayerTimeFont,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'லுஹர் -',
                      style: PrayerTimeFont,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'அஸர் -',
                      style: PrayerTimeFont,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'மஃரிப் -',
                      style: PrayerTimeFont,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'இஷா -',
                      style: PrayerTimeFont,
                    ),

                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$FajrTime',
                      style: PrayerTimeFont,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$SunriseTime',
                      style: PrayerTimeFont,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$DhuhrTime',
                      style: PrayerTimeFont,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$AsrTime',
                      style: PrayerTimeFont,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$MaghribTime',
                      style: PrayerTimeFont,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '$IshaTime',
                      style: PrayerTimeFont,
                    ),
                  ],
                ),


              ],
            )),
          ],
        ),
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
    this.readJson();
  }

}
