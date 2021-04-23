import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  final String title, image, author, description, content;

  NewsDetails(this.title, this.image, this.author, this.description, this.content);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(leading: 
           IconButton(icon:
              Icon(Icons.arrow_back_rounded), 
              color: Colors.grey[700], 
              onPressed: () {Navigator.pop(context);}
          ),
          backgroundColor: Colors.grey[50], 
          title: (Text('NEWSAPP',
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          )),
        ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10, right:5, left: 5, bottom: 10),
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(5), child:
                Title(color: Colors.black, child: Text(title, style: TextStyle(fontSize: 20)))),
              SizedBox(height: 10),
              FittedBox(
                  child: Image.network(image),
                      fit: BoxFit.fill),
              SizedBox(height: 10),
              Padding(padding: EdgeInsets.only(top: 10, right:5, left: 5), child:
                Title(color: Colors.grey[500], child: Text(description, style: TextStyle(fontSize: 15)))),
              Padding(padding: EdgeInsets.only(top: 10, right:5, left: 5), child:
                Title(color: Colors.grey[500], child: Text(content, style: TextStyle(fontSize: 15)))),
            ],
          ),
        ),
      ),
    );
  }
}
