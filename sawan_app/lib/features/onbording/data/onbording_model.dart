class OnbordingModel {
  final String image;
  final String title;
  final String subTitle;

  OnbordingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<OnbordingModel> onbordingData = [
  OnbordingModel(
    image: "assets/images/onbording1.png",
    title: "title1",
    subTitle: "subTitle1",
  ),
  OnbordingModel(
    image: "assets/images/onboring2.png",
    title: "title2",
    subTitle: "subTitle2",
  ),
  OnbordingModel(
    image: "assets/images/onbording3.png",
    title: "title3",
    subTitle: "subTitle3",
  ),
];
