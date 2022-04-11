import 'package:flutter/material.dart';

class RecipeListDetailsScreen extends StatefulWidget {
  const RecipeListDetailsScreen({Key? key}) : super(key: key);

  @override
  _RecipeListDetailsScreenState createState() => _RecipeListDetailsScreenState();
}

class _RecipeListDetailsScreenState extends State<RecipeListDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("RecipeList Details"))
    );
  }
}
