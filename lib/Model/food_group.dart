part of '../../utils/import/app_import.dart';

class FoodGroup {
  int? id;
  String? name;
  String? url;

  FoodGroup({
    this.id,
    required this.name,
    required this.url,
  });

  FoodGroup.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    url = map['url'];
  }

  toMap() {
    return {
      "id": id,
      "name": name,
      "url": url,
    };
  }

  FoodGroup.fromDBMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    url = map['url'];
  }

  toDBMap() {
    return {
      "name": name,
      "url": url,
    };
  }

  /* Just for Test  */

  static insertAllElement() {
    for (var element in foodGroupList) {
      DBHelper.dbHelper.insertFoodGroup(element);
      sleep(const Duration(milliseconds: 50));
    }
  }

  static List<FoodGroup> foodGroupList = [
    FoodGroup(
      id: 1,
      name: "Red Meat",
      url:
          "https://static.scientificamerican.com/sciam/cache/file/101091A0-11F7-4E40-ACD4FA284C65AFB6_source.jpg",
    ),
    FoodGroup(
      id: 2,
      name: "White Meat",
      url:
          "https://www.tastingtable.com/img/gallery/white-meat-vs-dark-is-there-a-nutritional-difference/intro-1659387223.jpg",
    ),
    FoodGroup(
      id: 3,
      name: "Macaroni",
      url:
          "https://t3.ftcdn.net/jpg/01/97/93/72/360_F_197937228_yal96DOOS8II0j2GMlfkq9EszsP2wGJk.jpg",
    ),
    FoodGroup(
      id: 4,
      name: "Sweets",
      url: "https://niftyrecipe.com/uploads/youtube/parse/vLCojNYWGCY.jpg",
    ),
    FoodGroup(
      id: 5,
      name: "Salad",
      url:
          "https://www.tasteofhome.com/wp-content/uploads/2020/06/types-of-salad-graphic.jpg",
    ),
    FoodGroup(
      id: 6,
      name: "Seafood",
      url:
          "https://www.foodandwine.com/thmb/tjkyiJutr0DdYGtGFy_hpcN0bSQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/seafood-blog618-f86e8baba8834537bbffa1d55e71c999.jpg",
    ),
    FoodGroup(
      id: 7,
      name: "baked",
      url:
          "https://www.kentpaper.com.au/wp-content/uploads/Concerns-about-health-create-opportunities-for-fortified-bakery-products-1.jpg",
    ),
    FoodGroup(
      id: 8,
      name: "Juices",
      url:
          "https://static.toiimg.com/thumb/msid-80850219,width-1280,resizemode-4/80850219.jpg",
    ),
    FoodGroup(
      id: 9,
      name: "Pizza",
      url:
          "https://lirp.cdn-website.com/ebdb0b272fe945b782417fab0cfc69bd/dms3rep/multi/opt/BlogIMG1-640w.jpg",
    ),
  ];
}
