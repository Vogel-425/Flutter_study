import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Todo list',
      home: Todo(),
    );
  }
}

class Todo extends StatefulWidget {
  @override
  _Todo createState() => _Todo();
}

class _Todo extends State<Todo> {
  final List<Map<String, dynamic>> Todolist =[];
  final _controller = TextEditingController();

  void add(){
    String text = _controller.text.trim();
    bool isDone = false;
    setState((){
      Todolist.add({
      'title' : text,
      'boolean':isDone});
    _controller.clear();
    });
  }
  void toggle(int index){
    setState((){
      Todolist[index]['boolean'] = ! Todolist[index]['boolean'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todolist'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: add,
                ),
              ],
            ),
            // リスト表示（オプション）
            Expanded(
              child: ListView.builder(
                itemCount: Todolist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(Todolist[index]['title']),
                    leading: Checkbox(
                      value: Todolist[index]['boolean'],
                      onChanged: (bool? value) {
                        toggle(index);}
                    )
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
