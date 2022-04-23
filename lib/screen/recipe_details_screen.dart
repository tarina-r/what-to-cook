import 'package:cook/model/recipe.model.dart';
import 'package:flutter/material.dart';

class RecipeListDetailsScreen extends StatefulWidget {
  final Items items;

  const RecipeListDetailsScreen({Key? key, required this.items}) : super(key: key);

  @override
  _RecipeListDetailsScreenState createState() => _RecipeListDetailsScreenState();
}

class _RecipeListDetailsScreenState extends State<RecipeListDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.items.name)),
      body: Column(
        children: [
          // Container(child: Image.asset(widget.items.image)),
          Image(image: AssetImage(widget.items.image)),
          Text(widget.items.id),
          Text(widget.items.ingredients.first.title),
          Text(widget.items.description),
        ],
      ),
    );
  }
}
