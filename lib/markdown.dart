import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:realme/models/note.dart';

class MarkdownWidget extends StatefulWidget {
  final Note note;

  MarkdownWidget({this.note});

  @override
  State<StatefulWidget> createState() {
    return _MarkdownPageState(note: note);
  }
}

class _MarkdownPageState extends State<MarkdownWidget> {
  Note note;
  bool _editing = false;
  IconData _iconData = Icons.edit;

  _MarkdownPageState({Note note}) {
    if(note == null) {
      _editing = true;
      _iconData = Icons.remove_red_eye;
      this.note = Note();
    }else {
      this.note = note;
    }
    print(this.note);
  }

  @override
  Widget build(BuildContext context) {
    if (_editing) {
      return Scaffold(
        appBar: AppBar(
          title: Text('M↓'),
        ),
        body: TextField(
          autofocus: false,
          expands: true,
          minLines: null,
          maxLines: null,
          controller: TextEditingController(text: note.note),
          onChanged: (content) {
            note.note = content;
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(_switchEditMode);
          },
          child: Icon(_iconData),
          mini: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('M↓'),
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.note_add), onPressed: _addMarkDown)
          ],
        ),

        body: Markdown(
          data: note.note,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(_switchEditMode);
          },
          child: Icon(_iconData),
          mini: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      );
    }
  }

  void _switchEditMode() {
    if (_editing) {
      _editing = false;
      note.title = note.note.split('\n')[0];
      note.note = note.note;
      note.updatedAt = formatDate(DateTime.now(), ['yyyy', '-', 'mm', '-', 'dd', ' ', 'HH', ':', 'nn', ':', 'ss']);
      note.save();
      _iconData = Icons.edit;
    } else {
      _editing = true;
      _iconData = Icons.remove_red_eye;
    }
  }

  void _addMarkDown() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(builder: (BuildContext context) {

        return Scaffold(
          appBar: AppBar(
            title: Text('新建笔记'),
          ),
          body: TextField(
            autofocus: true,
            expands: true,
            minLines: null,
            maxLines: null,
            controller: TextEditingController(text: ''),
            onChanged: (content) {
              note.note = content;
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                // todo
              });
            },
            child: Icon(Icons.save),
            mini: true,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        );
      }),
    );
  }
}
