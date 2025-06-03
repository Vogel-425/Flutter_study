import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}//アプリのエントリーポイント、MyAppというウィジェットからアプリをスタートする

// アプリ全体のルートウィジェット
class MyApp extends StatelessWidget {//statelessWidgetは変化を持たないUI
  @override
  Widget build(BuildContext context) {
    return MaterialApp(//MaterialAppはアプリの基本的なデザインを提供
      title: 'Flutter Demo',
      home: MyHomePage(),//homeにMyHomePageを指定すると最初に表示する画面が決まる
    );
  }
}
// 最初に表示される画面となる
class MyHomePage extends StatefulWidget {//StatefulWidgetは変化するデータを扱いたいときに使う
  @override
  //createStateにより、状態を管理する_MyHomePageStateを作る
  _MyHomePageState createState() => _MyHomePageState();
}

//状態を持つクラス
class _MyHomePageState extends State<MyHomePage>{
  static var _message = 'ok';//変数_messageに"ok"を代入

  @override
  //buildメソッドはUiを描画する関数
  //contextは現在のウィジェットの情報を持つ変数
  Widget build(BuildContext context){
    //画面の骨組みを作るウィジェット
    return Scaffold(
      appBar:AppBar(//画面上部のタイトルバーを表示
        title:Text('App Name'),
      ),
      body:Center(//body：画面の中身、Center：中央寄せ
        child:Column(//Column：ウィジェットを縦に並べる
          mainAxisAlignment : MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget>[
            Padding(
              padding:EdgeInsets.all(20.0),
              child:Text(_message,//_messageの内容を表示
                style:TextStyle(//フォントサイズやスタイルを指定
                  fontSize: 32.0,
                  fontWeight: FontWeight.w400,
                  fontFamily:"Roboto"),
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0),
            ),
            //ボタンの見た目と動作を定義
            Padding(padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
              onPressed: buttonPressed, 
                child: Text("tap me",
                style: TextStyle(fontSize: 32.0,
            color:const Color(0xff000000),
            fontWeight: FontWeight.w400,
            fontFamily: "Roboto"),
            )
            )
            ),
          ],
        ),
      ),
    );
  }
  //ボタンが押されたときの動作を定義
  void buttonPressed(){
    showDialog(//showDialogでポップアップ表示
      context : context,
      builder:(BuildContext context)=>AlertDialog(
        //AlaratDialogで contentの内容を表示
        title:Text("Hello!"),
        content:Text("This is sample."),
      )
    );
  }
 }
