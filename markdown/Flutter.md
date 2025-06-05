# モバイルアプリ開発(5/20)
本日はflutterのプロジェクトを作成しました。  
新規プロジェクトの作製コマンドは以下のとおりです。  
また、教科書p.50～58のコードを入力しました。
>flutter create ファイル名

Flutterの画面は**ウィジェット**と呼ばれる部品によって作成されます。アプリの画面は、このウィジェットの中に別にウィジェットを組み込み、またその中に別のウィジェットを組み込むといったような**ウィジェットツリー**という構造を取ります。

**StatelessWidgetクラス** 
：ステートを持たないウィジェットのベース  
**MaterialAppクラス**
：引数に様々な設定情報を指定できる  
**Scaffod**
：アプリ作製の土台となる部分を担当  
**AppBar**
：アプリケーションバーのウィジェットクラス  
**body**
：空白エリア全体の表示を担当  
[リポジトリのリンク](https://github.com/Vogel-425/Flutter_study.git)

---

# モバイルアプリ開発(5/21)
**StatelessWidget**  
ステートと呼ばれる状態を表す値を持たないウィジェットのベースとなるクラス   
bulidと呼ばれるメソッドが用意される。bulidメソッドは、BulidContextと呼ばれる組み込まれたウィジェットに関する機能がまとめられたものが引数として渡される。 

**StatefulWidget**  
Stateと呼ばれる状態を扱う耐えmのクラスが用意される。  
こちらのステートクラスでも、bulidというメソッドが用意され、ステートのbulidで生成したものがウィジェットクラスの表示として画面に表示される  
>class ステートクラス extends StatefulWidget{  
    @override
    ステートクラス createState() => ステートクラス;  
}

>class ステートクラス extends State<ウィジェットクラス>{  
    @override
    Widget bulid(BulidContext context){  
    }    
}

**override**  
親クラス（スーパークラス）で定義されたメソッドやプロパティを、子クラスで上書き（オーバーライド）することを明示するためのアノテーション   

**FloatingActionButton**  
フローティングアクションボタンと呼ばれる部品を作成することができる

---
# モバイルアプリ開発(5/27)

**main()**	アプリ起動のエントリーポイント  
**runApp()**	アプリを起動  
**MaterialApp**	アプリのテーマやルート設定  
**StatefulWidget**	状態を持ち変化するUIを構築  
**setState()**	状態を変更して再描画
**shuffle()**	リストをランダムに並べ替える  

**TextButton**	 特にUIの外観を持たない平面のボタン  
<TextButtonの基本形>
```dart
TextButton(key:null,
        onPressed:関数,
        child:ウィジェット)
```
**onPressed** クリックした時に実行される処理を指定できる  
**child** 内部に組み込むウィジェット  
**Padding** 余白を表示するためのコンテナ  

**ElevatedButton**　立体的に表示されるボタン  
**IconButton** アイコン付きボタンを表示する  
**FloathingActionButton** 右下に常に表示されるボタン  
**RawMaterialButon** 初期値の設定の影響を受けないボタン  

---  
# モバイルアプリ開発(5/28)  
入力のためのUI  
**TextField** 入力のためのウィジェット  
＜TextFieldの基本＞  
```dart  
TextField(
    controller:<・・・>,
    style:<・・・>
)
```
**controller**   
ウィジェットの値を管理するための専用のクラス  
TextFieldのような入力のウィジェットは値を保管するプロパティがないため  
**onChanged**  
リアルタイム処理を行わせることができるイベント  
<onchangwdメソッドの定義> 
```dart  
onCahged:textChanged,
```  
```dart
void textChanged(String val){
    setState((){
        <処理の内容>
    })
};
```  
**Checkbox**  
二者択一の入力をするのに用いられるもの  
チェックボックスのチェック部分のみを表示する  
<Checkboxの基本>  
```dart  
Checkbox(
    value:<bool>,//valueはチェックの状態を表すもの
    onChanged:関数
),  
```  
**Switch**  
クリックしてON/OFFするウィジェット  
SwitchとCheckboxは外観が異なるだけで全く同じウェイジェット  
**Radio**  
複数の項目から1つを選ぶウィジェット  
<Radioの仕組み>  
```dart  
Radio<型>(
    value:値,
    groupValue:値,
    onChanged:メソッド,
)  
```  
Radioを含むグループの全てを同じ型で使う必要があるため、どんな値を各ボタンの値として利用するかを考える必要がある  

**DropdownButton**  
複数の項目から1つを選ぶようなUI  
<Dropdownの基本形>  
```dart  
DropdownButton<型>(
    onChanged:関数,
    value:値,
    style:<TextStyle>,
    items:DropdownMenuItem<型>[・・・]
)
```  
**DropdownMenuItem**  
メニューの項目を作成するもの、型を統一する必要がある

**PopupMenuButton**  
ポップアップメニューを呼び出すためのボタン、AppBarの中に配置するのが基本  
itemBuilderにメニュー項目の情報がまとめられている  
```dart 
itemBuilder:(BulidCOntext context)=><PopupMenuEntry<型>>[・・・]
```

**Align**  
ウィジェットの位置揃えを調整するコンテナ  

**Slider**  
数値をアナログ的に入力するのに用いられるときに使用するもの  
<Sliderの基本>  
```dart
Slider(
    onChanged:関数,//変更時のイベント処理
    min:<double>,//最小値
    max:<double>,//最大値
    divisions:<int>,//分割数
    value:<double>,//現在選択されている値
),
```
# モバイルアプリ開発(6/3)
アラートやダイアログと呼ばれるUIは、必要に応じて画面にひょうじすることができる。  
表示には、**showDialog**という関数を利用する  
```dart  
showDialog(
    context : <BulidContext>,//ウィジェットのベースとなる
    builder : <WidgetBuilder>//表示するウィジェットを生成する関数を指定する
)
```  
---
**AlertDialog**
```dart
AlertDialog(
    title:ウィジェット,
    cntent:ウィジェット
)
```
---

**actions**  
AlertDialogに用意されているプロパティ、選択したボタンに応じた処理を作る事ができる  
```dart
actions:<widget>[ウィジェットのリスト]
```
---
**then**  
コールバック関数を指定するメソッド
```dart
showDialog(・・・),then<void>(・・処理・・)
```


---
**Navigator**  
表示されているアラートダイアログを消す働きをする  

---
**SimpleDialog**  
複数の項目から1つを選ぶような入力を作成するクラス  
```dart
SimpleDialog(
    title:ウィジェット,//タイトルのテキストなど
    children:[ウィジェットのリスト],//選択肢として表示する項目のリスト
)
```
---
**SimpleDialogOption**  
SimpleDialogの選択肢の項目として使う専用のクラス  
```dart
SimpleDialogOption(
    child:ウィジェット,//項目内に表示するウィジェット
    onPressed:・・処理・・,//項目をクリックしたときの処理
)
```
---
# モバイルアプリ開発(6/4)

**BottomNavigationBar**  
下部のバーを表示できるようになる  
BottomNavigationBarItemというウィジェットを組み込むことで、アイコン表示しクリックして操作できるようになる  
```dart
BottomNavigationBar(
    currentIndex: <int値>,//選択されているインデックス
    items: <BottomNavigationBarItem>[リスト],//表示する項目
    onTap: 関数 //バーのアイコンをクリックしたときに呼び出される関数
                // onTapは void メソッド (int value){・・・・・}の形で定義
)
```
---
**ListView**  
リストを表示するためのウィジェット。  
設定画面などの多数の項目を並べて表示するようなところで用いられる。  
```dart
ListView(
    shrinkWrap: <bool値>,//追加された項目に応じて大きさを自動調整するかどうか
    padding: <EdgeInsets>,
    children: <widget>[リスト],
)
```
**ListTile**  
ListViewで使用するリストを用意する  
```dart
ListTile(
    leading: アイコン指定,//項目の左端に表示するアイコン
    title: ウィジェット指定,//項目に表示する内容
    selected: TrueかFalse,//その項目の選択状態、選択されているならTrue
    onTap: 関数,          //クリックされたときのイベント処理
    onLongPress: 関数,    //長押しされたときのイベント処理
)
```
---
**SingleChildScrollView**  
項目が増えて一つの画面で表示しきれなくなった際に、その長さに応じて自動でスクロール表示できるようにするもの  
```dart
SingleChildScrollView(
    child: ウィジェット //組み込むウィジェットを用意する
)
```
---
# ルーティング
**Navigator**  
- 移動先のウィジェットを追加すると、そのウィジェットに表示を切り替える  
- 保管されたウィジェットを取り出すと、そのウィジェットに表示を戻す  
上記の重要な機能がある  
```dart
Navigator.push(<BuildContext>,<Route>);//移動先をプッシュする
```
```dart
Navigator.pop(<BulidContext>);//移動をポップする
```
まとめると、プッシュすると移動し、ポップすると戻る

---
**MaterialPageRoute**  
MaterialPageRouteやPageRouteはRouteのサブクラスである  
現在の表示や次に移動する画面の情報を記憶し、PageRouteクラスに置き換える働きをする  

**テキストによるルーティング**  
あらかじめルートと表示するウィジェットの関係を定義しておくことで、ナビゲーションの柔軟性を高めることができる。あらかじめていぎするのにはroutesプロパティを用いる  
```dart
routes: {
    //アドレスがpushされたら、対応するウィジェットを表示する
    'アドレス' : (context) => ウィジェット,
    'アドレス' : (context) => ウィジェット,
    必要な分だけこの跡にも続ける
}
```
**PushNamed**  
routesを利用するときのページ移動に用いるメソッド  
```dart
Navigation.PushNamed(
    <BulidContext>,
    'アドレス'//String型のアドレスを指定します
)
```
