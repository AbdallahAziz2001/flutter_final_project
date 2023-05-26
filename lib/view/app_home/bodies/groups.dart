part of '../../../utils/import/app_import.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<AppProvider>(context).foodGroupsList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: 75,
          margin: const EdgeInsets.all(5),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: Slidable(
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    label: 'Delete',
                    icon: Icons.delete,
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFFFE4A49),
                    onPressed: (context) {
                      Provider.of<AppProvider>(context, listen: false)
                          .deleteFoodGroup(
                              Provider.of<AppProvider>(context, listen: false)
                                  .foodGroupsList[index]);
                    },
                  ),
                  SlidableAction(
                    label: 'Edit',
                    icon: Icons.edit,
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF21B7CA),
                    onPressed: (context) {
                      Provider.of<AppProvider>(context, listen: false)
                          .changeCurrentFoodGroup(
                        currentFoodGroup:
                            Provider.of<AppProvider>(context, listen: false)
                                .foodGroupsList[index],
                      );
                      Navigator.of(context)
                          .pushNamed(AddEditFoodGroupPage.editRoute);
                    },
                  ),
                ],
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                ),
                onPressed: () {
                  Provider.of<AppProvider>(context, listen: false)
                      .changeCurrentFoodGroup(
                    currentFoodGroup:
                        Provider.of<AppProvider>(context, listen: false)
                            .foodGroupsList[index],
                  );
                  Navigator.of(context).pushNamed(FoodGroupsPage.route);
                },
                child: Center(
                  child: Text(
                    Provider.of<AppProvider>(context)
                        .foodGroupsList[index]
                        .name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
