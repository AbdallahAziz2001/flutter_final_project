part of '../../utils/import/app_import.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  String label;
  TextEditingController controller;

  CustomTextfield({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        top: 7.5,
        right: 10,
        bottom: 7.5,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
