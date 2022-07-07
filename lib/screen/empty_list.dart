
import 'package:flutter/material.dart';

class EmptyList extends StatefulWidget {
  const EmptyList({Key? key}) : super(key: key);

  @override
  _EmptyListState createState() => _EmptyListState();
}

class _EmptyListState extends State<EmptyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Oops!!!"),
        ),
        body: Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,//main axis the vertical axis in a column so this positions the children at the center of the vertical axis
              children:
              const [

                Text(
                    "No Recipes Found!!!!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),

              ],
              crossAxisAlignment: CrossAxisAlignment.center,
            )
        )
    );
  }

  }

