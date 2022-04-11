import 'package:cook/screen/recipe_details_screen.dart';
import 'package:flutter/material.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({Key? key}) : super(key: key);

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  navigate(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const RecipeListDetailsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recipe List")),
      body: Container(
        child: ElevatedButton(onPressed: () => navigate(context),child: const Text("Details"),),
      ),
    );
  }
}
