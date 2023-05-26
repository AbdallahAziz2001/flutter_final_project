part of 'utils/import/app_import.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.dbHelper.initDatabase();

  // FoodGroup.insertAllElement();
  // Food.insertAllElement();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return AppProvider();
      },
      child: const MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<AppProvider>(context).isDark
          ? ThemeData.dark()
          : ThemeData.light(),
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      routes: {
        AppHomePage.route: (context) => const AppHomePage(),
        FoodPage.route: (context) => const FoodPage(),
        FoodGroupsPage.route: (context) => const FoodGroupsPage(),
        AddEditFoodPage.addroute: (context) => AddEditFoodPage(isAdd: true),
        AddEditFoodPage.editroute: (context) => AddEditFoodPage(isAdd: false),
        AddEditFoodGroupPage.addRoute: (context) =>
            AddEditFoodGroupPage(isAdd: true),
        AddEditFoodGroupPage.editRoute: (context) =>
            AddEditFoodGroupPage(isAdd: false),
      },
      home: const SplashScreen(),
    );
  }
}
