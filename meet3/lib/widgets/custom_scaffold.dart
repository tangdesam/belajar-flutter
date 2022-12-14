import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  const CustomScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('custom scaffold'),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            _buildShortAppBar(context)
          ],
        ),
      ),
    );
  }
}

Widget _buildShortAppBar(BuildContext context) {
  return Card(
    margin: EdgeInsets.all(0),
    shape: const BeveledRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(16.0)
      )
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Text(
            'N',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ],
    ),
  );
}