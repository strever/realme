import 'package:flutter/material.dart';
import 'package:realme/markdown.dart';
import 'package:realme/models/note.dart';
import 'package:flutter/cupertino.dart';

class MarkdownListWidget extends StatefulWidget {
  @override
  _MarkdownListState createState() {
    return new _MarkdownListState();
  }
}

class _MarkdownListState extends State<MarkdownListWidget> {
  List<Note> _notes = [];
  final _favorites = new Set<Note>();
  final _biggerFont = const TextStyle(fontSize: 16.0);

  _MarkdownListState() {
    _getNotes().then((val) => setState(() {
      _notes = val;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Notes'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.favorite), onPressed: _fetchFavorites)
        ],
      ),
      body: _buildNotesView(),
    );
  }

  Widget _buildNotesView() {
    return ListView.builder(
      padding: const EdgeInsets.all(5.0),
      itemBuilder: (context, i) {
        if (i.isOdd)
          return new Divider(
            height: 2.0,
          );

        final index = i ~/ 2;
        if (index >= _notes.length) {
          return null;
        }

        return _buildRowView(_notes[index]);
      },
    );
  }

  Widget _buildRowView(Note note) {
    final bool inFavorites = _favorites.contains(note);
    return new ListTile(
      title: Text(
        note.title,
        style: _biggerFont,
      ),
      subtitle: Text(note.updatedAt
          //note.note.substring(0, min(100, note.note.length)),
          ),
      trailing: Container(
        child: new IconButton(
          icon: Icon(
            inFavorites ? Icons.favorite : Icons.favorite_border,
            color: inFavorites ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              if (inFavorites) {
                _favorites.remove(note);
              } else {
                _favorites.add(note);
              }
            });
          },
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          new MaterialPageRoute<void>(builder: (BuildContext context) {
            return MarkdownWidget(note: note);
          }),
        );
      },
    );
  }

  void _fetchFavorites() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(builder: (BuildContext context) {
        final Iterable<ListTile> favorites = _favorites.map((Note note) {
          return new ListTile(
            title: Text(note.title, style: _biggerFont),
          );
        });

        final List<Widget> divided = ListTile.divideTiles(
          context: context,
          tiles: favorites,
        ).toList();

        return new Scaffold(
            appBar: new AppBar(
              title: Text('已收藏'),
            ),
            body: new ListView(
              children: divided,
            ));
      }),
    );
  }

  _getNotes() async {
    return await Note.findAll();
  }
}
