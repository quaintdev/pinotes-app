import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinotes/api/NoteService.dart';
import 'package:pinotes/api/grpc/note.pb.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

void main() {
  runApp(PiNotes());
}

class PiNotes extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PiNotes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'PiNotes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var notesList = List<Note>();
  @override
  void initState() {
    super.initState();
    print("calling listNotes");
    _listNotes();
  }

  _listNotes() async {
    var response = NoteService.listNotes();
    response.then((onValue) {
      print("response received");
      notesList.clear();
      onValue.notes.forEach((value) {
        notesList.add(value);
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.close),
          //   onPressed: () {
          //     SystemNavigator.pop();
          //   },
          // )
        ],
      ),
      body: Container(
          child: ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (BuildContext ctx, int index) {
                return ListTile(
                    title: Text(notesList[index].title),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ViewNote(note: notesList[index])),
                      ).then((value) {
                        _listNotes();
                      });
                    });
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ViewNote extends StatefulWidget {
  final Note note;
  ViewNote({Key key, @required this.note}) : super(key: key);
  @override
  _ViewNotePageState createState() => _ViewNotePageState();
}

class _ViewNotePageState extends State<ViewNote> {
  final controller = ScrollController();
  TextEditingController txtController = TextEditingController();

  bool _editMode = false;

  @override
  void initState() {
    NoteService.viewNote(widget.note).then((response) {
      setState(() {
        txtController.text = response.notes[0].content;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note.title),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // todo: confirm with a dilog box whether user wants to delete
              NoteService.deleteNote(widget.note);
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(_editMode ? Icons.remove_red_eye : Icons.edit),
            onPressed: () {
              setState(() {
                _editMode = !_editMode;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.sync),
            onPressed: () {
              NoteService.saveNote(widget.note).then((response) {
                // todo: show a snack bar about sync success
                if (response.success == true) print("Note synced");
              });
            },
          ),
        ],
      ),
      body: SafeArea(
          child: _editMode
              ? Container(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: TextField(
                    controller: txtController,
                    //scrollPadding: EdgeInsets.all(20.0),
                    onChanged: (value) {
                      widget.note.content = value;
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 99999,
                    autofocus: true,
                  ),
                )
              : Markdown(
                  controller: controller,
                  selectable: true,
                  data: txtController.text,
                )),
    );
  }
}
