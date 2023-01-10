class ExpertModel {
  String name;
  String rate;
  String type;
  String photo;
  bool isFavorite;
  bool isOnline;

  ExpertModel({
    required this.isFavorite,
    required this.name,
    required this.rate,
    required this.type,
    required this.photo,
    required this.isOnline,
  });
}

class ExpertsModel {
  List<ExpertModel> experts;

  ExpertsModel({
    required this.experts,
  });
}

ExpertsModel dummyExperts = ExpertsModel(
  experts: [
    ExpertModel(
      name: "Kareem Adel",
      isFavorite: true,
      isOnline: true,
      rate: "(5.0)",
      type: "Supply Chain",
      photo: "asset/images/profile_image.png",
    ),
    ExpertModel(
      name: "Merna Adel",
      isFavorite: false,
      isOnline: true,
      rate: "(4.9)",
      type: "Supply Chain",
      photo: "asset/images/expert2.png",
    ),
    ExpertModel(
      name: "Ahmed Adel",
      isFavorite: true,
      isOnline: true,
      rate: "(5.0)",
      type: "Supply Chain",
      photo: "asset/images/profile_image.png",
    ),
    ExpertModel(
      name: "Menna Adel",
      isFavorite: false,
      isOnline: true,
      rate: "(4.9)",
      type: "Supply Chain",
      photo: "asset/images/expert2.png",
    ),
    ExpertModel(
      name: "Mohamed Adel",
      isFavorite: true,
      isOnline: true,
      rate: "(5.0)",
      type: "Supply Chain",
      photo: "asset/images/profile_image.png",
    ),
    ExpertModel(
      name: "Nada Adel",
      isFavorite: false,
      isOnline: true,
      rate: "(4.9)",
      type: "Supply Chain",
      photo: "asset/images/expert2.png",
    ),
  ],
);
