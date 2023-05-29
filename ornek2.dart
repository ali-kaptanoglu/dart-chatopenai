import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: TamEkranSayfa(),
  ));
}
class TamEkranSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1478358161113-b0e11994a36b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
          fit: BoxFit.cover
        ) ,
      ),
    );
  }
}
