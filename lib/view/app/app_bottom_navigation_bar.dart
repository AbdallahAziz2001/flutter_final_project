part of '../../utils/import/app_import.dart';

class HomePageBottomNavigationBar extends StatelessWidget {
  const HomePageBottomNavigationBar({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) {
        Provider.of<AppProvider>(context, listen: false)
            .changeIndexOfBottomNavigationBar(
                indexOfBottomNavigationBar: value);
      },
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blue,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps),
          label: "Groups",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_sharp),
          label: "Favorite",
        ),
      ],
    );
  }
}
