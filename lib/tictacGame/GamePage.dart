import 'package:flutter/material.dart';
import './gameCommunication.dart';

class GamePage extends StatefulWidget {
  GamePage({
    Key key,
    this.opponentName,
    this.character,
  }) : super(key: key);

  final String opponentName;
  final String character;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> grid = <String>["", "", "", "", "", "", "", "", ""];
  @override
  void initState() {
    super.initState();

    game.addListener(_onAction);
  }

  @override
  void dispose() {
    game.removeListener(_onAction);
    super.dispose();
  }

  _onAction(message) {
    switch (message["action"]) {
      case 'resigned':
        Navigator.of(context).pop();
        break;
      case 'play':
        var data = (message["data"] as String).split(';');
        grid[int.parse(data[0])] = data[1];

        setState(() {
          //forced rebuild
        });
        break;
    }
  }

  _doResign() {
    game.send('resign', '');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Game against:${widget.opponentName}',
                style: TextStyle(fontSize: 16.0)),
            actions: [
              RaisedButton(onPressed: _doResign, child: Text('Resign'))
            ],
          ),
          body: _buildBoard()),
    );
  }

  ///Buid gane board
  ///

  Widget _buildBoard() {
    return SafeArea(
      top: false,
      bottom: false,
      child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return _gridItem(index);
          }),
    );
  }

  Widget _gridItem(int index) {
    Color color = grid[index] == "X" ? Colors.blue : Colors.red;
    return InkWell(
      onTap: () {
        if (grid[index] == "") {
          grid[index] = widget.character;
          game.send('play', '$index;${widget.character}');

          setState(() {});
        }
      },
      child: GridTile(
          child: Card(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            grid[index],
            style: TextStyle(fontSize: 50.0, color: color),
          ),
        ),
      )),
    );
  }
}
