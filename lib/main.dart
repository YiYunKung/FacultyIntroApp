import 'package:flutter/material.dart';
import 'professor1.dart';
import 'professor2.dart';
import 'professor3.dart';
import 'professor4.dart';
import 'professor5.dart';
import 'professor6.dart';
import 'professor7.dart';
import 'professor8.dart';
import 'professor9.dart';
import 'professor10.dart';
import 'professor11.dart';
import 'professor12.dart';
import 'professor13.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      /*theme: ThemeData(
        primarySwatch: Colors.blue,
      ),*/
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final ValueNotifier<String> _selectedItem = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    // 建立AppBar
    final appBar = AppBar(
      title: const Text('系所成員',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
      ),
      backgroundColor: Color(0xFF6A7D9F),
    );

    const icons = <String>['assets/image1.jpg', 'assets/image2.jpg', 'assets/image3.jpg',
      'assets/image4.jpg', 'assets/image5.jpg', 'assets/image6.jpg', 'assets/image7.jpg', 'assets/image8.jpg',
      'assets/image9.jpg', 'assets/image10.jpg', 'assets/image11.jpg', 'assets/image12.jpg', 'assets/image13.jpg'];

    const names = <String>['林楚迪 教授', '陸子強 副教授', '郭煌政 助理教授',
      '章定遠 教授', '葉瑞峰 教授', '盧天麒 副教授', '翁麒耀 副教授', '陳宗和 教授',
      '許政穆 教授 ', '王智弘 教授', '李龍盛 助理教授', '王皓立 助理教授', '柯建全 專案研究員'];

    const subtitles = <String>['軟體工程暨知識工程領域\n▪資工系系主任', '軟體工程暨知識工程領域', '軟體工程暨知識工程領域',
      '互動多媒體領域', '互動多媒體領域', '互動多媒體領域', '互動多媒體領域', '網路及資訊安全領域',
      '網路及資訊安全領域', '網路及資訊安全領域', '網路及資訊安全領域\n▪電算中心系統研發組組長\n▪圖書館系統資訊組組長', '網路及資訊安全領域\n▪電算中心資訊網路組組長', '專案研究'];

    const pages = [IntroPage1(), IntroPage2(), IntroPage3(),
      IntroPage4(), IntroPage5(), IntroPage6(), IntroPage7(), IntroPage8(),
      IntroPage9(), IntroPage10(), IntroPage11(), IntroPage12(), IntroPage13()];

    // 建立主畫面的教授列表
    var listView = ListView.builder(
      itemCount: names.length,
      physics: const NeverScrollableScrollPhysics(), // 禁止內部滾動
      shrinkWrap: true, // 根據內容決定高度
      itemBuilder: (context, index) =>
        Card(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
          color: Color(0xFFFFFFFF),
          child: ListTile(
            title: Text(names[index], style: TextStyle(fontSize:20, height: 1.8,),),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => pages[index])
            ),
            leading: Container(
              child: CircleAvatar(backgroundImage: AssetImage(icons[index]),),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 3),
            ),
            subtitle: Text(subtitles[index], style: const TextStyle(fontSize:16),),
          ),
        ),
    ) ;

    // 建立App的操作畫面
    /*final btn = ElevatedButton(
      child: const Text('開啟第二頁'),
      onPressed: () =>
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => IntroPage1())),
    );*/

    final widget = SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(25, 25, 25, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          listView,
          /*ValueListenableBuilder<String>(
            builder: _selectedItemBuilder,
            valueListenable: _selectedItem,
          ),*/
        ],
      )
    );

    // 結合AppBar和App操作畫面
    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
      backgroundColor: Color(0xFFC3CCDD),
    );

    return appHomePage;
  }

  Widget _selectedItemBuilder(BuildContext context, String itemName, Widget? child) {
    final widget = Text(itemName,
        style: const TextStyle(fontSize: 20));
    return widget;
  }
}
