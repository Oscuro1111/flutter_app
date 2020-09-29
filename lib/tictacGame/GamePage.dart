import 'package:flutter/cupertino.dart';
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
  bool lockMove;
  bool win = false;
  @override
  void initState() {
    super.initState();

    game.addListener(_onAction);
    lockMove = widget.character == "X";
  }

  @override
  void dispose() {
    game.removeListener(_onAction);
    super.dispose();
  }

  bool winner(String chr) {
    int flg;
    List<List<int>> wpt = [
      //check rows
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      //check column
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      //check diagonal
      [2, 4, 6],
      [0, 4, 8]
    ];

    for (int i = 0; i < wpt.length; i++) {
      flg = 0;
      for (int j = 0; j < wpt[i].length; j++) {
        if (chr == grid[wpt[i][j]]) {
          flg += 1;
        } else {
          --flg;
        }
      }

      if (flg == 3) {
        print('flg value:$flg');
        return true;
      }
    }

    return false;
  }

  _onAction(message) {
    switch (message["action"]) {
      case 'resigned':
        Navigator.of(context).pop();
        break;
      case 'play':
        var data = (message["data"] as String).split(';');
        grid[int.parse(data[0])] = data[1];

        if (winner("X") || winner("O")) {
          _doResign();
        }
        lockMove = !lockMove;

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
        if (grid[index] == "" && lockMove) {
          lockMove = false;
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
