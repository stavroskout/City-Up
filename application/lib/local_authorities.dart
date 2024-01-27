import 'package:city_up/post_smth_new.dart';
import 'package:city_up/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class LocalAuthorities extends StatefulWidget{
  const LocalAuthorities({Key? key}) : super(key:key);



  @override
  _LocalAuthoritiesState createState() => _LocalAuthoritiesState();
}

class _LocalAuthoritiesState extends State<LocalAuthorities> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Authorities Articles',
      home: Scaffold(
          appBar: AppBar(
            leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
            centerTitle: true,
            title: const Text('Local Authorities',
                style: TextStyle(
                    color: Colors.lightBlue, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          bottomNavigationBar: SizedBox(
        height: 80,
      child: BottomAppBar(
         child: Row(
           children: [
              IconButton(tooltip: 'Live',icon: Icon(Icons.live_tv, color: Colors.red, size:33.0), onPressed: () {}),
              Spacer(),
              IconButton(onPressed: () =>{Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=> Profile()))} ,
              tooltip: 'Profile',icon: Icon(Icons.man, size:33.0,)),
      ],
    ),
  ),),
  floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.black,),
          onPressed: () => {Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=> PostSomethingNew()))
            },
          tooltip:  'Post Something New',
          backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: Center(
            child: RandomWords(),
          )),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<StatefulWidget> createState() => RandomWordState();
}

class RandomWordState extends State<RandomWords> {
  final _suggestion = <String>[];
  int _articleNumber = 1;
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    final String = lorem(paragraphs: 4, words: 200);
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          if (index.isOdd) return Divider();

          final i = index ~/ 2;

          if (i >= _suggestion.length) {
            _suggestion.add(
                "Article $_articleNumber: ${lorem(paragraphs: 2, words: 200)}");
            _articleNumber++;
            ;
          }

          return ListTile(
            title: Text(
              _suggestion[i],
              style: _biggerFont,
            ),
          );
        });
  }
}