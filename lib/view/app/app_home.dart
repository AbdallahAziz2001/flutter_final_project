part of '../../utils/import/app_import.dart';

class AppHomePage extends StatelessWidget {
  static String route = "AppHomePage";

  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> bodies = [
      const HomePage(),
      const GroupsPage(),
      const FavoritePage(),
    ];
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const AppAppBar(),
      body:
          bodies[Provider.of<AppProvider>(context).indexOfBottomNavigationBar],
      bottomNavigationBar: HomePageBottomNavigationBar(
        currentIndex:
            Provider.of<AppProvider>(context).indexOfBottomNavigationBar,
      ),
    );
  }
}
