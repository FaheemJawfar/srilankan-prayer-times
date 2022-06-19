import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class SuraPage extends StatefulWidget {
  final int SuraNumber;
  final String SuraName;


  const SuraPage({Key? key, required this.SuraNumber, required this.SuraName}) : super(key: key);

  @override
  State<SuraPage> createState() => _SuraPageState();
}

List _quranDb = [];
List _QuranArabic = [];

class _SuraPageState extends State<SuraPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          centerTitle: true,
          title: Text(widget.SuraName,style: TextStyle(
            fontSize: 15,
          ),),
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              _quranDb.isNotEmpty && _QuranArabic.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: int.parse(
                              _quranDb[widget.SuraNumber]["versecount"]),
                          itemBuilder: (context, index) {
                            return Card(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: ListTile(
                                title: Text('${_QuranArabic[widget.SuraNumber]["aya"][index]["-text"]}',style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Al_Qalam',
                                  fontWeight: FontWeight.normal,
                                ),
                                  textDirection: TextDirection.rtl,),

                                subtitle: Text('${index+1}. ${_quranDb[widget.SuraNumber]["aya"][index]["-text"]}',style: TextStyle(
                                    fontFamily: 'MeeraInimai',
                                  fontSize: 16,
                                  color: Colors.black,
                                ),),

                                onTap: () {
                                  //print(_QuranArabic[0]["-name"]);
                                },
                              ),
                            );

                          }),
                    )
                  : Container(),
            ],
          ),
        ));
  }

  Future<void> readTamilSura() async {
    final String response =
        await rootBundle.loadString('assets/quran_tamil.json');
    final data = await json.decode(response);
    setState(
      () {
        _quranDb = data["sura"];
      },
    );
  }

  Future<void> readArabicSura() async {
    final String response =
    await rootBundle.loadString('assets/quran_arabic.json');
    final data = await json.decode(response);
    setState(
          () {
        _QuranArabic = data["sura"];
      },
    );
  }

  @override
  void initState() {
    super.initState();
    readTamilSura();
    readArabicSura();
  }
}
