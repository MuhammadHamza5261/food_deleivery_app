class UnboardingContent{

  String image;
  String title;
  String description;

  UnboardingContent({required this.image, required this.title, required this.description});

}

List<UnboardingContent> contents = [
  UnboardingContent(
      image: "assets/images/screen1.png",
      title: 'Select from our\n    Best menu',
      description: 'Pick your food from our menu\n     More than 35 times',
  ),
  UnboardingContent(
      description: 'You can pay cash on deleivery and\n   Card payment is available',
      image: 'assets/images/screen2.png',
      title: 'Easy and Online Payment'
  ),
  UnboardingContent(
      description: 'Deliver your food at your\n     Doorstep',
      image: 'assets/images/screen3.png',
      title: 'Quick Delivery at your Doorstep'
  ),
];