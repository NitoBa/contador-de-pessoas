import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Pessoas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homepage()
    );
  }
}

 

class Homepage extends StatefulWidget {

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _count = 0;
  dynamic _position = FloatingActionButtonLocation.centerDocked;
  dynamic _iconbutton = Icon(Icons.add);
  String _warning = "Pode Entrar";
  bool _isCheio = false;
  addPerson(){
    setState(() {
      //count < 5 ? count++ : warning = "Lotado";
      if (_count == 5){
        _warning = "Lotado";
        _isCheio = true;
        _position = FloatingActionButtonLocation.endDocked;
        _iconbutton = Icon(Icons.remove);
      }else _count++;
    });
    
    }
    removePerson(){
    setState(() {

      if(_count == 0){
        _warning = "Pode Entrar";
        _isCheio = false;
        _position = FloatingActionButtonLocation.centerDocked;
        _iconbutton = Icon(Icons.add);
      }else      
      _count--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: Icon(Icons.add)),
      appBar: AppBar(
        title: Text("Contador de pessoas"),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 60,
        ),
      ),
      body: Stack(
            children: <Widget>[
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image.asset("images/restaurant.jpg",
                  fit: BoxFit.cover, height: 1500,)
                  
                  ),
              ),
              Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Pessoas $_count",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                child: Text("+1", style: TextStyle(color: Colors.white)),
                onPressed: addPerson,
              ),
              FlatButton(
                child: Text("-1", style: TextStyle(color: Colors.white,)),
                onPressed: removePerson,
              ),
                ],
              ),
              Text(_warning,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
              ),
            ],
          ),
            ],
          ),
        floatingActionButton: FloatingActionButton(
          child: _iconbutton, 
          onPressed: _isCheio ? removePerson : addPerson
          
          ),
        floatingActionButtonLocation: _position//FloatingActionButtonLocation.centerDocked,
      );
  }
}
