import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/tictacGame/GamePage.dart';

import './gameCommunication.dart';

class StartPage extends StatefulWidget {
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  static final TextEditingController _name = new TextEditingController();
  bool loackMove = false;
  List<dynamic> playersList = [];

  @override
  void initState() {
    super.initState();
    game.addListener(_onGameDataReceived);
  }

  @override
  void dispose() {
    game.removeListener(_onGameDataReceived);
    game.close();
    super.dispose();

  }

  _onGameDataReceived(message) {
    switch (message['action']) {
      case "players_list":
        setState(() {
          playersList = message["data"];
        });
        break;
      case "new_game":
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => GamePage(
                      opponentName: message["data"],
                      character: 'O',
                    )));
        break;
    }
  }

  Widget _buildJoin() {
    if (game.playerName != "") {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            key: UniqueKey(),
            controller: _name,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: "Enter your name",
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                icon: const Icon(Icons.person)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: _onGameJoin,
              child: Text("join."),
            ),
          )
        ],
      ),
    );
  }

  _onGameJoin() {
    game.send('join', _name.text);

    setState(() {});
  }

  Widget _playersList() {
    if (game.playerName == "") {
      return Container(
        child: Text(''),
      );
    }

    List<Widget> children = playersList.map((playerInfo) {

      var key = UniqueKey();

      if(playerInfo["isEmpty"]==true){

          return Container();
      }

      if (game.playerID == playerInfo["id"]) {

        Widget loading = CircularProgressIndicator();

        return playersList.length - 1 == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[loading],
              )
            : Container();
      }

      return ListTile(
        key: key,
        title: Text(playerInfo["name"]),
        trailing: playerInfo["free"]?RaisedButton(
          onPressed: () {
            _onPlayGame(playerInfo["name"], playerInfo["id"]);
          },
          child: Text("Play"),
        ):FlatButton.icon(onPressed: (){}, icon: Icon(Icons.stop ,color: Colors.amber,), label: Text("Busy...")),
      );
    }).toList();

    return Column(
      children: <Widget>[
        ListTile(
          key: UniqueKey(),
          title: Text("XAgent Oscuro games"),
          trailing: CircularProgressIndicator(),
          onTap: () {},
        ),
        ...children
      ],
    );
  }

  _onPlayGame(String opponentName, String opponentId) {
    game.send('new_game', opponentId);

    //Bug
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => GamePage(
                  opponentName: opponentName,
                  character: 'X',
                )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        appBar: new AppBar(
          title: Text('Tic-Tac-Toe'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildJoin(),
              Text('Active players'),
              _playersList()
            ],
          ),
        ),
      ),
    );
  }
}
