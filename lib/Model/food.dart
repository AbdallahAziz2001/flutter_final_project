part of '../../utils/import/app_import.dart';

class Food {
  int? id;
  String? name;
  String? url;
  String? service;
  List<String>? ingredients;
  List<String>? directions;
  FoodGroup? foodGroup;
  bool? isFavorite;

  Food({
    this.id,
    required this.name,
    required this.url,
    required this.service,
    required this.ingredients,
    required this.directions,
    required this.foodGroup,
    required this.isFavorite,
  });

  Food.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    url = map['url'];
    service = map['yield'];
    ingredients = map['ingredients'];
    directions = map['directions'];
    foodGroup = FoodGroup.fromMap(map['foodGroup']);
    isFavorite = map['isFavorite'];
  }

  toMap() {
    return {
      "id": id,
      "name": name,
      "url": url,
      "service": service,
      "ingredients": ingredients,
      "directions": directions,
      "food_group": foodGroup!.id,
      "isFavorite": isFavorite,
    };
  }

  Food.fromDBMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    url = map['url'];
    service = map['service'];
    ingredients = (json.decode(map['ingredients']) as List<dynamic>).map(
      (element) {
        return "$element";
      },
    ).toList();
    directions = (json.decode(map['directions']) as List<dynamic>).map(
      (element) {
        return "$element";
      },
    ).toList();
    DBHelper.dbHelper
        .getFoodGroupById(foodGroupId: int.parse(map['food_group']))
        .then((element) => foodGroup = element);
    isFavorite = map['is_favorite'] == 1 ? true : false;
  }

  toDBMap() {
    return {
      "name": name,
      "url": url,
      "service": service,
      "ingredients": json.encode(ingredients),
      "directions": json.encode(directions),
      "food_group": foodGroup!.id,
      "is_favorite": isFavorite! ? 1 : 0,
    };
  }

  /* Just for Test  */

  static insertAllElement() {
    for (var element in foodList) {
      DBHelper.dbHelper.insertFood(element);
      sleep(const Duration(milliseconds: 50));
    }
  }

  static List<Food> foodList = [
    Food(
      id: 1,
      name: "Irish Car Bomb",
      service: "No Yield",
      url:
          "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2015%2F10%2F15%2Firish-car-bomb-mr.jpg",
      ingredients: [
        "½ ounce Bailey’s Irish Cream",
        "½ ounce Jameson Irish Whiskey",
        "¾ pint Guinness stout (1 beer)",
      ],
      directions: [
        "[1] Add the Bailey’s and Jameson to a shot glass, layering the Bailey’s on the bottom. Pour the Guinness into a pint glass or beer mug ¾ of the way full and let settle. Drop the shot glass into the Guinness and chug. ",
      ],
      foodGroup: FoodGroup.foodGroupList[7],
      isFavorite: true,
    ),
    Food(
      id: 2,
      name: "Lemon Chicken",
      service: "Makes 8 servings",
      url:
          "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2010%2F05%2F17%2FMR_051019_LemonChicken158-2000.jpg",
      ingredients: [
        "4 skinned and boned chicken breasts (about 1 1/2 lb.)",
        "1 teaspoon salt",
        "½ teaspoon pepper",
        "⅓ cup all-purpose flour",
        "4 tablespoons butter, divided"
            "2 tablespoons olive oil, divided"
            "¼ cup chicken broth"
            "¼ cup lemon juice"
            "8 lemon slices"
            "¼ cup chopped fresh flat-leaf parsley"
            "Garnish: lemon slices"
      ],
      directions: [
        "[1] Cut each chicken breast in half lengthwise. Place chicken between 2 sheets of heavy-duty plastic wrap; flatten to 1/4-inch thickness, using a rolling pin or flat side of a meat mallet. Sprinkle chicken with salt and pepper. Lightly dredge chicken in flour, shaking off excess.",
        "[2] Melt 1 Tbsp. butter with 1 Tbsp. olive oil in a large nonstick skillet over medium-high heat. Cook half of chicken in skillet 2 to 3 minutes on each side or until golden brown and done. Transfer chicken to a serving platter, and keep warm. Repeat procedure with 1 Tbsp. butter and remaining olive oil and chicken.",
        "[3] Add broth and lemon juice to skillet, and cook 1 to 2 minutes or until sauce is slightly thickened, stirring to loosen particles from bottom of skillet. Add 8 lemon slices.",
        "[4] Remove skillet from heat; add parsley and remaining 2 Tbsp. butter, and stir until butter melts. Pour sauce over chicken. Serve immediately. Garnish, if desired.",
      ],
      foodGroup: FoodGroup.foodGroupList[1],
      isFavorite: false,
    ),
    Food(
      id: 3,
      name: "No-Bake Chocolate Eclair Cake",
      service: "1 serving",
      url:
          "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2015%2F09%2F01%2Fno-bake-chocolate-eclair-cake-mr.jpg",
      ingredients: [
        "3 box(es) 3.5 oz instant vanilla pudding",
        "3 cups milk",
        "1 container 8oz cool whip",
        "Graham crackers",
        "⅓ cup cocoa",
        "1 cup sugar",
        "¼ cup milk",
        "1 stick butter",
        "1 teaspoon vanilla",
      ],
      directions: [
        "[1] Prepare the filling by combining pudding mix and milk. Beat. Stir in Cool Whip. ",
        "[2] Place a layer of graham crackers in bottom of a 9x13 dish. Spread 1/2 filling mixture on top. Repeat with another layer of graham crackers, add rest of filling, top with final layer of graham crackers.",
        "[3] To make the topping, bring cocoa, milk and sugar to a roiling boil. Let topping boil for one full minute, stirring frequently. ",
        "[4] Remove from heat, cool 1 minute.",
        "[5] Add butter and vanilla to topping, and stir till butter is melted.",
        "[6] Pour chocolate topping over graham crackers and refrigerate overnight. ",
      ],
      foodGroup: FoodGroup.foodGroupList[3],
      isFavorite: false,
    ),
    Food(
      id: 4,
      name: "Creamy Cucumber Salad",
      service: "Serves 4 (serving size: about 1 cup)",
      url:
          "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2019%2F07%2F01%2Fcreamycucumbersalad-2000.jpg",
      ingredients: [
        "1 pound English cucumber, cut into 1/8-in. thick slices (1 large cucumber)",
        "¾ cup thinly sliced sweet onion (1 small onion)",
        "1 teaspoon kosher salt, divided",
        "⅓ cup sour cream",
        "1 tablespoon rice vinegar",
        "1 tablespoon chopped fresh dill, plus more for garnish",
        "2 teaspoons chopped fresh chives, plus more for garnish",
        "¼ teaspoon black pepper",
      ],
      directions: [
        "[1] Combine cucumber and onion in a colander set over a large bowl. Toss with 3/4 teaspoon of the salt. Let stand, tossing occasionally, until softened and liquid has drained out, about 1 hour. Pat vegetables dry with paper towels. ",
        "[2] Meanwhile, stir together sour cream, vinegar, dill, chives, and remaining 1/4 teaspoon salt in a medium bowl. Add cucumber and onion mixture; toss to coat. Serve sprinkled with pepper, dill, and chives.",
      ],
      foodGroup: FoodGroup.foodGroupList[4],
      isFavorite: true,
    ),
    Food(
      id: 5,
      name: "The Classic Burger",
      service: "Makes 4 servings",
      url:
          "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2005%2F06%2F22%2Fclassic-burgers-u.jpg",
      ingredients: [
        "1 pound ground lean (7% fat) beef",
        "1 large egg",
        "½ cup minced onion",
        "¼ cup fine dried bread crumbs",
        "1 tablespoon Worcestershire",
        "1 or 2 cloves garlic, peeled and minced",
        "About 1/2 teaspoon salt",
        "About 1/4 teaspoon pepper",
        "4 hamburger buns (4 in. wide), split",
        "About 1/4 cup mayonnaise",
        "About 1/4 cup ketchup",
        "4 iceberg lettuce leaves, rinsed and crisped",
        "1 firm-ripe tomato, cored and thinly sliced",
        "4 thin slices red onion",
      ],
      directions: [
        "[1] In a bowl, mix ground beef, egg, onion, bread crumbs, Worcestershire, garlic, 1/2 teaspoon salt, and 1/4 teaspoon pepper until well blended. Divide mixture into four equal portions and shape each into a patty about 4 inches wide.",
        "[2] Lay burgers on an oiled barbecue grill over a solid bed of hot coals or high heat on a gas grill (you can hold your hand at grill level only 2 to 3 seconds); close lid on gas grill. Cook burgers, turning once, until browned on both sides and no longer pink inside (cut to test), 7 to 8 minutes total. Remove from grill.",
        "[3] Lay buns, cut side down, on grill and cook until lightly toasted, 30 seconds to 1 minute.",
        "[4] Spread mayonnaise and ketchup on bun bottoms. Add lettuce, tomato, burger, onion, and salt and pepper to taste. Set bun tops in place.",
      ],
      foodGroup: FoodGroup.foodGroupList[0],
      isFavorite: false,
    ),
    Food(
      id: 6,
      name: "Easy Peach Cobbler",
      service: "10 servings",
      url:
          "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2000%2F12%2F02%2F0886_192302_DuPree_MR_13310-2000.jpg",
      ingredients: [
        "½ cup unsalted butter",
        "1 cup all-purpose flour",
        "2 cups sugar, divided",
        "1 tablespoon baking powder",
        "Pinch of salt",
        "1 cup milk",
        "4 cups fresh peach slices",
        "1 tablespoon lemon juice",
        "Ground cinnamon or nutmeg (optional)",
      ],
      directions: [
        "[1] Melt butter in a 13- x 9-inch baking dish.",
        "[2] Combine flour, 1 cup sugar, baking powder, and salt; add milk, stirring just until dry ingredients are moistened. Pour batter over butter (do not stir).",
        "[3] Bring remaining 1 cup sugar, peach slices, and lemon juice to a boil over high heat, stirring constantly; pour over batter (do not stir). Sprinkle with cinnamon, if desired.",
        "[4] Bake at 375° for 40 to 45 minutes or until golden brown. Serve cobbler warm or cool.",
      ],
      foodGroup: FoodGroup.foodGroupList[3],
      isFavorite: false,
    ),
    Food(
      id: 7,
      name: "Extra-Easy Lasagna",
      service: "6 to 8 servings",
      url:
          "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2001%2F01%2F02%2Fextra-easy-lasagna-sl.jpg",
      ingredients: [
        "1 pound lean ground beef",
        "4 cups tomato-basil pasta sauce",
        "6 uncooked lasagna noodles",
        "1 (15-ounce) container ricotta cheese",
        "2 ½ cups (10 ounces) shredded mozzarella cheese",
        "¼ cup hot water",
      ],
      directions: [
        "[1] Cook beef in a large skillet over medium heat, stirring until it crumbles and is no longer pink; drain. Stir in pasta sauce.",
        "[2] Spread one-third of meat sauce in a lightly greased 11- x 7-inch baking dish; layer with 3 noodles and half each of ricotta cheese and mozzarella cheese. (The ricotta cheese layers will be thin.) Repeat procedure; spread remaining one-third of meat sauce over mozzarella cheese. Slowly pour 1/4 cup hot water around inside edge of dish. Tightly cover baking dish with 2 layers of heavy-duty aluminum foil.",
        "[3] Bake at 375° for 45 minutes; uncover and bake 10 more minutes. Let stand 10 minutes before serving.",
        "[4] Note: For testing purposes only, we used Classico Tomato & Basil pasta sauce.",
      ],
      foodGroup: FoodGroup.foodGroupList[2],
      isFavorite: true,
    ),
    Food(
      id: 8,
      name: "7-Layer Mexican Dip",
      service: "Serves 8",
      url:
          "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2012%2F11%2F06%2F7-layer-mexican-dip-gb-4x3-1-2000.jpg",
      ingredients: [
        "16-oz. can refried beans",
        "2 cups sour cream",
        "1-1/4 oz. pkg. taco seasoning mix",
        "2 avocados, pitted, peeled and mashed",
        "2 teaspoons lemon juice",
        "3 cloves garlic, minced",
        "2 cups shredded Cheddar cheese",
        "4 green onions, diced",
        "¼ cup black olives, sliced",
        "1 tomato, diced",
        "tortilla chips",
      ],
      directions: [
        "[1] Spread beans in the bottom of a 10 round or square clear glass dish set aside. Combine sour cream and seasoning mix; spread over beans. Mix avocados, lemon juice and garlic; layer over sour cream mixture. Sprinkle with cheese; top with onions, olives and tomato. Serve with tortilla chips.",
      ],
      foodGroup: FoodGroup.foodGroupList[6],
      isFavorite: false,
    ),
    Food(
      id: 9,
      name: "Whole Roasted Red Snapper with Potatoes and Onions",
      service:
          "Serves 4 (serving size: about 4 oz. fish, 2 potatoes, 2 red onion wedges)",
      url:
          "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2017%2F04%2F18%2Fwholeroastedredsnapper.jpg",
      ingredients: [
        "1 ½ cups loosely packed fresh flat-leaf parsley leaves",
        "1 medium shallot (about 2 oz.), roughly chopped",
        "3 garlic cloves, roughly chopped",
        "1 tablespoon fresh thyme leaves",
        "1 ½ teaspoons lemon zest (from 1 lemon)",
        "½ teaspoon crushed red pepper",
        "¾ cup olive oil",
        "2 ¾ teaspoons kosher salt, divided",
        "1 pound baby gold potatoes (about 8 potatoes)",
        "1 small red onion (about 8 oz.), cut lengthwise into 1-in. wedges",
        "1 (3-lb.) whole red snapper, cleaned, scaled, gutted, and fins trimmed",
        "Lemon wedges, for serving",
      ],
      directions: [
        "[1] Preheat oven to 425°F. Line a rimmed baking sheet with parchment paper. Set aside.",
        "[2] Process parsley, shallot, garlic, thyme, lemon zest, and red pepper in a food processor until finely chopped, about 15 seconds. Add oil, and process until well incorporated, about 15 seconds. Toss together potatoes, onion wedges, 2 tablespoons of the parsley mixture, and 1 teaspoon of the salt in a large bowl.",
        "[3] Cut 3 (2-inch-long) slits diagonally on both sides of fish, cutting all the way to the bone on both sides. Rub exterior and inside of cuts with 1 cup of the parsley mixture and remaining 1 3/4 teaspoons salt; place fish on prepared baking sheet. Spread potato mixture around fish. Bake in preheated oven until fish is opaque and flaky and vegetables are tender, about 30 minutes.",
        "[4] Drizzle fish with remaining 1/4 cup parsley mixture. Serve with lemon wedges.",
      ],
      foodGroup: FoodGroup.foodGroupList[5],
      isFavorite: true,
    ),
    Food(
      id: 10,
      name: "Grilled Pesto Pizza with Chicken, Mozzarella, and Ricotta",
      service: "No Yield",
      url:
          "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2015%2F04%2F02%2Fgrilled-pesto-pizza-chicken-mozzarella-ricotta-cl.jpg",
      ingredients: [
        "2 tablespoons extra virgin olive oil, divided, plus more for brushing",
        "8 ounces sliced crimini mushrooms",
        "½ cup chopped onion",
        "1 cup shredded rotisserie chicken",
        "2 tablespoons chicken stock",
        "½ cup ricotta cheese",
        "½ teaspoon salt",
        "½ teaspoon freshly ground black pepper",
        "3 tablespoons semolina flour or polenta",
        "1 pound refrigerated prepared pizza dough, at room temperature",
        "⅓ cup fresh prepared pesto",
        "6 ounces shredded mozzarella cheese (about 1 1/2 cups)",
        "2 plum tomatoes, thinly sliced",
        "¼ cup fresh basil, cut into thin strips",
      ],
      directions: [
        "[1] Preheat grill to medium-high heat (350° to 400°). Heat 1 tablespoon oil in a large skillet over medium-high heat. Add mushrooms; sauté 3 minutes. Add onion; sauté 4 minutes. Add chicken and chicken stock; cook 1 minute.",
        "[2] In a small bowl, combine ricotta cheese, salt, and pepper.",
        "[3] Sprinkle semolina flour evenly over a large, rimless baking sheet. Place pizza dough on baking sheet, and pat into a 14-inch circle.",
        "[4] Brush grill grates with oil, and slide pizza dough onto grates. Brush top of dough with remaining 1 tablespoon oil. Grill 2 minutes or until grill marks appear. Reduce heat to medium-low; flip dough, and spread evenly with pesto, leaving a 3/4-inch border. Spread chicken mixture evenly over pesto. Top evenly with mozzarella and tomato slices, and dot with ricotta mixture. Grill, covered with grill lid, 5 to 7 minutes or until cheese melts. Remove pizza from grill, and top with basil. Serve immediately.",
      ],
      foodGroup: FoodGroup.foodGroupList[8],
      isFavorite: true,
    ),
  ];
}
