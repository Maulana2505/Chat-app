import 'package:flutter/material.dart';

class CostumcardChatyou extends StatelessWidget {
  const CostumcardChatyou({super.key,  required this.msg});

  final String msg;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
           Alignment.bottomLeft,
      child: Container(
        constraints: BoxConstraints( maxWidth: MediaQuery.of(context).size.width *0.8),
          child: Card(
            margin: EdgeInsets.all(8),
              child: Stack(
        children: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(msg),
        )],
      ))),
    );
  }
}
