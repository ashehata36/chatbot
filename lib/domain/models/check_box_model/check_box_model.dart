class CheckBoxModel {
  String title;
  bool isChecked;

  CheckBoxModel({
    required this.isChecked,
    required this.title,
  });
}

class CheckBoxesModel {
  List<CheckBoxModel> checkBoxesItems;

  CheckBoxesModel({
    required this.checkBoxesItems,
  });
}

CheckBoxesModel dummyCheckBoxes = CheckBoxesModel(
  checkBoxesItems: [
    CheckBoxModel(
      title: "Security",
      isChecked: true,
    ),
    CheckBoxModel(
      title: "Supply Chain",
      isChecked: false,
    ),
    CheckBoxModel(
      title: "Information Technology",
      isChecked: false,
    ),
    CheckBoxModel(
      title: "Human Resource",
      isChecked: false,
    ),
    CheckBoxModel(
      title: "Business Research",
      isChecked: false,
    ),
    CheckBoxModel(
      title: "Say Done, Or Press Send to Apply",
      isChecked: true,
    ),
  ],
);
