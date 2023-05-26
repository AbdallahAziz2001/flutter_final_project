part of '../../utils/import/app_import.dart';

class DBHelper {
  DBHelper._();
  static DBHelper dbHelper = DBHelper._();
  late Database database;

  initDatabase() async {
    MyCss.log(message: "Start ", color: MyCss.green);
    String databasePath = await getDatabasesPath();
    String path = '$databasePath/food_app.db';
    database = await openDatabase(
      path,
      version: 2,
      onCreate: (database, version) {
        MyCss.log(message: "\tDataBase Created", color: MyCss.white);
        database.execute('''
          CREATE TABLE food_groups (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            url TEXT NOT NULL)
          ''');
        MyCss.log(
            message: "\t    Food Groups Table Created", color: MyCss.green);
        database.execute('''
          CREATE TABLE foods (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            url TEXT NOT NULL,
            service TEXT NOT NULL,
            ingredients TEXT NOT NULL,
            directions TEXT NOT NULL,
            food_group TEXT NOT NULL,
            is_favorite BOOLEAN NOT NULL,
            FOREIGN KEY (food_group) REFERENCES food_groups (id) ON DELETE CASCADE ON UPDATE CASCADE)
          ''');
        MyCss.log(message: "\t    Foods Table Created", color: MyCss.green);
      },
    );
    MyCss.log(message: "End Init DataBase", color: MyCss.red);
  }

  Future<List<FoodGroup>> getAllFoodGroups() async {
    MyCss.log(message: "Start Get All Food Groups", color: MyCss.green);
    List<Map> results = await database.query('food_groups');
    List<FoodGroup> foodgroups = results
        .map((element) => FoodGroup.fromDBMap(element as Map<String, dynamic>))
        .toList();
    MyCss.log(message: "\tSelected All Food Groups", color: MyCss.green);
    MyCss.log(message: "End Get All Food Groups", color: MyCss.red);
    return foodgroups;
  }

  Future<FoodGroup> getFoodGroupById({required int foodGroupId}) async {
    MyCss.log(message: "Start Get Food Group By Id", color: MyCss.green);
    List<Map> results =
        await database.query('food_groups', where: 'id = $foodGroupId');
    MyCss.log(message: "\tSelected Food Group By Id", color: MyCss.green);
    MyCss.log(message: "End Get Food Group By Id", color: MyCss.red);
    return FoodGroup.fromMap(results.first as Map<String, dynamic>);
  }

  Future<int> insertFoodGroup(FoodGroup foodGroup) async {
    MyCss.log(message: "Start Insert Food Group", color: MyCss.green);
    int rowId = await database.insert(
      'food_groups',
      foodGroup.toDBMap(),
    );
    MyCss.log(message: "\tInserted Food Group", color: MyCss.green);
    MyCss.log(message: "End Insert Food Group", color: MyCss.red);
    return rowId;
  }

  updateFoodGroup(FoodGroup foodGroup) async {
    MyCss.log(message: "Start Update Food Group", color: MyCss.green);
    await database.update(
      'food_groups',
      foodGroup.toDBMap(),
      where: 'id = ${foodGroup.id}',
    );
    MyCss.log(message: "\tUpdated Food Group", color: MyCss.green);
    MyCss.log(message: "End Update Food Group", color: MyCss.red);
  }

  deleteFoodGroup(FoodGroup foodGroup) async {
    MyCss.log(message: "Start Delete Food Group", color: MyCss.green);
    await database.delete(
      'food_groups',
      where: 'id = ${foodGroup.id}',
    );
    MyCss.log(message: "\tDeleted Food Group", color: MyCss.green);
    MyCss.log(message: "End Delete Food Group", color: MyCss.red);
  }

  Future<List<Food>> getAllFoods() async {
    MyCss.log(message: "Start Get All Foods", color: MyCss.green);
    List<Map> results = await database.query('foods');
    List<Food> foods = results
        .map((element) => Food.fromDBMap(element as Map<String, dynamic>))
        .toList();
    MyCss.log(message: "\tSelected All Food", color: MyCss.green);
    MyCss.log(message: "End Get All Foods", color: MyCss.red);
    return foods;
  }

  Future<Food> getFoodById({required int foodId}) async {
    MyCss.log(message: "Start Get Food By Id", color: MyCss.green);
    List<Map> results = await database.query('foods', where: 'id = $foodId');
    MyCss.log(message: "\tSelected Food By Id", color: MyCss.green);
    MyCss.log(message: "End Get Food By Id", color: MyCss.red);
    return Food.fromMap(results.first as Map<String, dynamic>);
  }

  Future<int> insertFood(Food food) async {
    MyCss.log(message: "Start Insert Food", color: MyCss.green);
    int rowId = await database.insert(
      'foods',
      food.toDBMap(),
    );
    MyCss.log(message: "\tInsertd Food", color: MyCss.green);
    MyCss.log(message: "End Insert Food", color: MyCss.red);
    return rowId;
  }

  updateFood(Food food) async {
    MyCss.log(message: "Start Update Food", color: MyCss.green);
    await database.update(
      'foods',
      food.toDBMap(),
      where: 'id = ${food.id}',
    );
    MyCss.log(message: "\tUpdated Food", color: MyCss.green);
    MyCss.log(message: "End Update Food", color: MyCss.red);
  }

  updateFoodIsFavorite(Food food) async {
    MyCss.log(message: "Start Update Food Favorite", color: MyCss.green);
    await database.update(
      'foods',
      {
        "is_favorite": food.isFavorite! ? 1 : 0,
      },
      where: 'id = ${food.id}',
    );
    MyCss.log(message: "\tUpdated Food Favorite", color: MyCss.green);
    MyCss.log(message: "End Update Food Favorite", color: MyCss.red);
  }

  deleteFood(Food food) async {
    MyCss.log(message: "Start Delete Food", color: MyCss.green);
    await database.delete(
      'foods',
      where: 'id = ${food.id}',
    );
    MyCss.log(message: "\tDeleted Food", color: MyCss.green);
    MyCss.log(message: "End Delete Food", color: MyCss.red);
  }
}
