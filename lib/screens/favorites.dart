import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class Favorites extends StatelessWidget {
 final List<Meal> favoriteMeal;
  Favorites(this.favoriteMeal);
  @override
  Widget build(BuildContext context) {
     if(favoriteMeal.isEmpty) {
       return Center(
         child: Text('you have no favorites yot- let\'s add some'),
       );
     }
     else{
       return ListView.builder(itemBuilder: (ctx,index){
         return MealItem (
           id: favoriteMeal[index].id,
           title:favoriteMeal[index].title,
           imageUrl: favoriteMeal[index].imageUrl,
           duration:favoriteMeal[index].duration,
           complexity: favoriteMeal[index].complexity,
           affordability: favoriteMeal[index].affordability,
         );
       },
         itemCount:favoriteMeal.length );
     }
  }
}
