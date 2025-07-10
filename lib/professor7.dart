import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroPage7 extends StatelessWidget {
  const IntroPage7({super.key});

  /*void _launchURL() async {
    final Uri url = Uri.parse('https://www.ncyu.edu.tw/csie/Contents?nodeId=22149');
    if (!await launchUrl(url)) {
      throw '無法開啟連結 $url';
    }
  }*/

  @override
  Widget build(BuildContext context) {
    var header = GestureDetector(
      //onTap: _launchURL,
      child: Row(
          children: [
            ClipOval(
                child: Image.asset(
                  'assets/image7.jpg',
                  width: 65,
                  height: 65,
                  fit: BoxFit.cover,  // 填滿圓形
                )
            ),
            const SizedBox(width: 15),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(
                        '翁麒耀 副教授',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '國立清華大學資訊工程學系博士',
                        style: TextStyle(fontSize: 16),
                      )
                    ]
                )
            )
          ]
      ),
    );

    const tables = <String>['職位', 'Email', '研究室分機', '研究室編號', '實驗室名稱',
      '研究專長', '主要經歷', '個人網站', '研究成果',
    ];
    const contents = <String>['副教授', 'cyweng@mail.ncyu.edu.tw',
      '05-2717739', 'A16-510', '多媒體應⽤實驗室',
      '影像處理\n多媒體應用\n虛擬實境/擴充',
      '曾任 國立屏東大學電腦科學與人工智慧學系副教授\n曾任 國立屏東大學資訊科學系副教授\n曾任 國立屏東大學資訊科學系助理教授\n曾任 國立屏東大學進修推廣處社區學習中心主任\n曾任 國立清華大學資訊工程系博士後研究員\n曾任 國立清華大學資訊工程系博士後研究員',
      '',
      'https://web085004.adm.ncyu.edu.tw/eRes.pub/Res.aspx?thrid=A0919'
    ];

    var intro = ListView.builder(
      itemCount: tables.length,
      physics: const NeverScrollableScrollPhysics(), // 禁止內部滾動
      shrinkWrap: true, // 根據內容決定高度
      itemBuilder: (context, index) =>
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch, // 讓左右兩邊對齊高度
            children: [
              Container(
                width: 115,
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(tables[index], style: TextStyle(fontSize: 15), textAlign: TextAlign.center,),
                margin: EdgeInsets.fromLTRB(0, 0, 6, 10),
                decoration: BoxDecoration(
                  color: Color(0xFFC3CCDD),
                  borderRadius: BorderRadius.circular(8), // 邊框圓角
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: Text(contents[index], style: TextStyle(fontSize: 14),),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF6A7D9F), // 邊框顏色
                      width: 1.2,             // 邊框寬度
                    ),
                    borderRadius: BorderRadius.circular(8), // 邊框圓角
                  ),
                ),
              ),
            ],
          ),
        )

    );

    var appBody = SingleChildScrollView(    // 滾動式頁面
        padding: EdgeInsets.fromLTRB(25, 25, 25, 20),  // 設定頁面間距（左，上，右，下）
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header,
            const SizedBox(height: 22),
            intro,
            const SizedBox(height: 10),
          ],
        )
    );

    final appBar = AppBar(
      title: const Text('系所成員介紹',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
      ),
      backgroundColor: Color(0xFF6A7D9F),
    );

    var app = Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar,
        body: appBody,
    );
    return app;
  }
}
