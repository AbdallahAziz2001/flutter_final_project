part of '../../utils/import/app_import.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(''),
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: Provider.of<AppProvider>(context).isDark ? true : false,
            onChanged: (bool value) {
              Provider.of<AppProvider>(context, listen: false)
                  .changeIsDark(isDark: value);
            },
          ),
          const Divider(thickness: 3),
          Padding(
            padding: const EdgeInsets.only(left: 7.5, top: 2.5),
            child: Text("Foods",
                style: TextStyle(
                  fontSize: 15,
                  color: Provider.of<AppProvider>(context).isDark
                      ? Colors.white70
                      : Colors.black54,
                )),
          ),
          ListTile(
            title: const Text('Add Food'),
            leading: const Icon(Icons.add_circle),
            trailing: const Icon(
              Icons.arrow_right_rounded,
              size: 40,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(AddEditFoodPage.addroute);
            },
          ),
          const Divider(thickness: 3),
          Padding(
            padding: const EdgeInsets.only(left: 7.5, top: 2.5),
            child: Text("Food Groups",
                style: TextStyle(
                  fontSize: 15,
                  color: Provider.of<AppProvider>(context).isDark
                      ? Colors.white70
                      : Colors.black54,
                )),
          ),
          ListTile(
            title: const Text('Add Food Group'),
            leading: const Icon(
              Icons.add_circle,
              size: 30,
            ),
            trailing: const Icon(
              Icons.arrow_right_rounded,
              size: 40,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(AddEditFoodGroupPage.addRoute);
            },
          ),
        ],
      ),
    );
  }
}
