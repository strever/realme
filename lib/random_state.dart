import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _wordPairs = <WordPair>[];
  final _favorites = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('真材实料的我'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.list), onPressed: _fetchFavorites)
        ],
      ),
      body: _buildWordPairs(),
    );
  }

  void _fetchFavorites() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(builder: (BuildContext context) {
        final Iterable<ListTile> favorites =
            _favorites.map((WordPair wordPair) {
          return new ListTile(
            title: Text(wordPair.asPascalCase, style: _biggerFont),
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
          body: new ListView(children: divided,)
        );
      }),
    );
  }

  Widget _buildWordPairs() {
    _wordPairs.addAll(generateWordPairs().take(10));
    return ListView.builder(
      padding: const EdgeInsets.all(6.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();

        final index = i ~/ 2;
        if (index >= _wordPairs.length) {
          return null;
          //_wordPairs.addAll(generateWordPairs(maxSyllables: 5).take(2));
        }

        return _buildRow(_wordPairs[index]);
      },
    );
  }

  Widget _buildRow(WordPair wordPair) {
    final bool inFaverites = _favorites.contains(wordPair);
    return new ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        inFaverites ? Icons.favorite : Icons.favorite_border,
        color: inFaverites ? Colors.red : Colors.grey,
      ),
      onTap: () {
        setState(() {
          if (inFaverites) {
            _favorites.remove(wordPair);
          } else {
            _favorites.add(wordPair);
          }
        });
      },
    );
  }
}
