class BottomSheetModel {
  String title;
  String subTitle;
  String photo;

  BottomSheetModel({
    required this.title,
    required this.subTitle,
    required this.photo,
  });
}

class BottomSheetsModel {
  List<BottomSheetModel> bottomSheetItems;

  BottomSheetsModel({
    required this.bottomSheetItems,
  });
}

BottomSheetsModel dummyBottomSheets = BottomSheetsModel(
  bottomSheetItems: [
    BottomSheetModel(
      title: "Information Technology",
      subTitle: "23 Experts",
      photo: "asset/icons/bs1.png",
    ),
    BottomSheetModel(
      title: "Supply Chain",
      subTitle: "23 Experts",
      photo: "asset/icons/bs2.png",
    ),
    BottomSheetModel(
      title: "Security",
      subTitle: "23 Experts",
      photo: "asset/icons/bs3.png",
    ),
    BottomSheetModel(
      title: "Human Resource",
      subTitle: "23 Experts",
      photo: "asset/icons/bs4.png",
    ),
    BottomSheetModel(
      title: "Immigration",
      subTitle: "23 Experts",
      photo: "asset/icons/bs5.png",
    ),
    BottomSheetModel(
      title: "Translation",
      subTitle: "23 Experts",
      photo: "asset/icons/bs6.png",
    ),
  ],
);
