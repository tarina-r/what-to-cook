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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(image: AssetImage(widget.items.image)),
            const Text(
              'Ingredients',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            // ListView.builder(
            //     itemCount: widget.items.ingredients.length,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         // leading: Text(widget.items.name),
            //         leading: Text((index + 1).toString() + '.'),
            //         title: Text(widget.items.ingredients[index].title),
            //       );
            //     }),
            for (Ingredients ing in widget.items.ingredients) Text(ing.title),
            const Text(
              "Recipe Description",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            //Text(widget.items.ingredients.first.title),
            //Text(widget.items.id),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(widget.items.description),
            ),
          ],
        ),
      ),
    );
  }
}
