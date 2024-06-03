import 'package:food_deleviery_app/images/images.dart';

class UnBoardingContent{

  String image;
  String title;
  String description;

  UnBoardingContent({required this.image, required this.title, required this.description});

}

List<UnBoardingContent> contents = [

  UnBoardingContent(
      image: AppImages.screenOneImage,
      title: 'Select from our\n    Best menu',
      description: 'Pick your food from our menu\n     More than 35 times',
  ),

  UnBoardingContent(
      description: 'You can pay cash on deleivery and\n   Card payment is available',
      image: AppImages.screenTwoImage,
      title: 'Easy and Online Payment'
  ),

  UnBoardingContent(
      description: 'Deliver your food at your\n   Doorstep',
      image: AppImages.screenThreeImage,
      title: 'Quick Delivery at your Doorstep'
  ),


];