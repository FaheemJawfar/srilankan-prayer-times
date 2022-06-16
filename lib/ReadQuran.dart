import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;



class ReadQuran extends StatefulWidget {
  const ReadQuran({Key? key}) : super(key: key);

  @override
  State<ReadQuran> createState() => _ReadQuranState();
}

class _ReadQuranState extends State<ReadQuran> {

  List _quranDb = [];


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              _quranDb.isNotEmpty
                  ? Expanded(child: ListView.builder(itemCount: _quranDb.length,
                  itemBuilder: (context, index) {
                    
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(

                    title: Text('${_quranDb[index]["tamilname"]}'),
                    subtitle: Text('${_quranDb[index]["-name"]}'),
                    onTap: (){
                      print("Success");
                    },
                  ),
                );

              }


              ),
              ) : Container(),
            ],
          ),
        )
    );
  }



  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/quran_tamil.json');
    final data = await json.decode(response);
    setState(() {
      //_prayerTimes = data["prayer_times"];
      _quranDb = data['sura'];


    });
  }

  @override
  void initState() {

    super.initState();
    this.readJson();
  }
}
