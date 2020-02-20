import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class ViewCode extends StatelessWidget{

  ViewCode({Key key, this.title, this.content}): super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title),),
      body: SyntaxView(
        code: this.content,
        syntax: Syntax.DART,
        syntaxTheme: SyntaxTheme.dracula(),
        withZoom: true,
        withLinesCount: true,
      ),
    );
  }

}