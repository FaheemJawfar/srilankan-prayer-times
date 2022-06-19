import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:srilankan_prayer_times/SuraPage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          centerTitle: true,
          title: Text('அத்தியாயங்கள்'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              _quranDb.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: _quranDb.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
                              child: ListTile(
                                title: Text(
                                  '${_quranDb[index]["tamilname"]}',
                                  style: TextStyle(fontFamily: 'MeeraInimai'),
                                ),
                                subtitle: Text(
                                  '${_quranDb[index]["-name"]}',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                onTap: () {
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuraPage(selectedSura : index)));
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SuraPage(
                                          SuraNumber: index,
                                          SuraName:
                                              '${_quranDb[index]["tamilname"]}')));
                                },
                              ),
                            );
                          }),
                    )
                  : Container(
                      child: Expanded(
                      child: Center(
                        child: SpinKitFadingCube(
                          color: Colors.green[400],
                          size: 50.0,
                        ),
                      ),
                    )),
            ],
          ),
        ));
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/quran_tamil.json');
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
