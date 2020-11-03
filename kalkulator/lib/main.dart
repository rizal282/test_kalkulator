// program kalkulator ini dibuat dengan menggunakan Flutter
// Rizal Ramdani 

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _hasil = "...";
  bool _chkAngka1 = false, _chkAngka2 = false, _chkAngka3 = false; // set checkbox ke false atau belum diceklis
  int _angka1, _angka2, _angka3; // untuk menampung data angka yg diparsing ke integer

  // untuk menangkap angka yg diinput oleh user
  final _inpAngka1 = new TextEditingController();
  final _inpAngka2 = new TextEditingController();
  final _inpAngka3 = new TextEditingController();

  // proses parsing data angka dari string ke integer
  void _parsingToInt(){
    setState(() {
      _angka1 = int.parse(_inpAngka1.text);
      _angka2 = int.parse(_inpAngka2.text);
      _angka3 = int.parse(_inpAngka3.text);
    });
  }

  // proses menambahkan
  void _tambahkan(){
    _parsingToInt();

    if(_chkAngka1 == true && _chkAngka2 == true && _chkAngka3 == true){
      int hasil = _angka1 + _angka2 + _angka3;
      setState(() {
        _hasil = hasil.toString();
      });
    }else if(_chkAngka1 == true && _chkAngka2 == true){
      int hasil = _angka1 + _angka2;
      setState(() {
        _hasil = hasil.toString();
      });
    }else if(_chkAngka1 == true && _chkAngka3 == true){
      int hasil = _angka1 + _angka3;
      setState(() {
        _hasil = hasil.toString();
      });
    }else if(_chkAngka2 == true && _chkAngka3 == true){
      int hasil = _angka2 + _angka3;
      setState(() {
        _hasil = hasil.toString();
      });
    }else{
      setState(() {
        _hasil = "Tidak dapat menambahkan!";
      });
    }
  }

  // proses mengurangi
  void _kurangi(){
    _parsingToInt();

    if(_chkAngka1 == true && _chkAngka2 == true && _chkAngka3 == true){
      int hasil = _angka1 - _angka2 - _angka3;
      setState(() {
        _hasil = hasil.toString();
      });
    }else if(_chkAngka1 == true && _chkAngka2 == true){
      int hasil = _angka1 - _angka2;
      setState(() {
        _hasil = hasil.toString();
      });
    }else if(_chkAngka1 == true && _chkAngka3 == true){
      int hasil = _angka1 - _angka3;
      setState(() {
        _hasil = hasil.toString();
      });
    }else if(_chkAngka2 == true && _chkAngka3 == true){
      int hasil = _angka2 - _angka3;
      setState(() {
        _hasil = hasil.toString();
      });
    }else{
      setState(() {
        _hasil = "Tidak dapat mengurangi!";
      });
    }
  }

  // proses mengalikan
  void _kalikan(){
    _parsingToInt();

    if(_chkAngka1 == true && _chkAngka2 == true && _chkAngka3 == true){
      int hasil = _angka1 * _angka2 * _angka3;
      setState(() {
        _hasil = hasil.toString();
      });
    }else if(_chkAngka1 == true && _chkAngka2 == true){
      int hasil = _angka1 * _angka2;
      setState(() {
        _hasil = hasil.toString();
      });
    }else if(_chkAngka1 == true && _chkAngka3 == true){
      int hasil = _angka1 * _angka3;
      setState(() {
        _hasil = hasil.toString();
      });
    }else if(_chkAngka2 == true && _chkAngka3 == true){
      int hasil = _angka2 * _angka3;
      setState(() {
        _hasil = hasil.toString();
      });
    }else{
      setState(() {
        _hasil = "Tidak dapat mengalikan!";
      });
    }
  }

  // proses membagi
  void _bagi(){
    _parsingToInt();

    if(_chkAngka1 == true && _chkAngka2 == true && _chkAngka3 == true){
      int hasil = _angka1 ~/ _angka2 ~/ _angka3;
      setState(() {
        _hasil = hasil.toString();
      });
    }else if(_chkAngka1 == true && _chkAngka2 == true){
      int hasil = _angka1 ~/ _angka2;
      setState(() {
        _hasil = hasil.toString();
      });
    }else if(_chkAngka1 == true && _chkAngka3 == true){
      int hasil = _angka1 ~/ _angka3;
      setState(() {
        _hasil = hasil.toString();
      });
    }else if(_chkAngka2 == true && _chkAngka3 == true){
      int hasil = _angka2 ~/ _angka3;
      setState(() {
        _hasil = hasil.toString();
      });
    }else{
      setState(() {
        _hasil = "Tidak dapat membagi!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator Sederhana"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        child: _elementKalkulator(),
      ),
    );
  }

  Widget _elementKalkulator(){
    return ListView(
      children: [
        Row(
          children: [
             Expanded(child: TextFormField(
              controller: _inpAngka1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            )),
            Expanded(
              child: Checkbox(
                onChanged: (bool val){
                  setState(() {
                    _chkAngka1 = val;
                  });
                },
                value: _chkAngka1,
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Expanded(child: TextFormField(
              controller: _inpAngka2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            )),
            Expanded(
              child: Checkbox(
                onChanged: (bool val){
                  setState(() {
                    _chkAngka2 = val;
                  });
                },
                value: _chkAngka2,
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Expanded(child: TextFormField(
              controller: _inpAngka3,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            )),
            Expanded(
              child: Checkbox(
                onChanged: (bool val){
                  setState(() {
                    _chkAngka3 = val;
                  });
                },
                value: _chkAngka3,
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
                  child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlineButton(onPressed: () => _tambahkan(), child: Text("+"),),
              OutlineButton(onPressed: () => _kurangi(), child: Text("-"),),
              OutlineButton(onPressed: () => _kalikan(), child: Text("x"),),
              OutlineButton(onPressed: () => _bagi(), child: Text("/"),),
            ],
          ),
        ),
        SizedBox(height: 20,),
        Divider(color: Colors.black,),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Hasil : "),
            Text(_hasil),
          ],
        ),
      ],
    );
  }
}
