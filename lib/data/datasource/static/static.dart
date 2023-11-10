import 'package:ecommerceapp/core/constant/imageasset.dart';

import '../../model/onboardingmodel.dart';

List<OnBoardingModel>
    onBoardingList = [
  OnBoardingModel( // OnBoardingModel 1
    title: 'Chose Product',
    image: AppImageAsset.onBoardingImage1,
    body: 'We have +100 products. Choose \n your Product from our E- \n Commerce Shop',
  ),
  OnBoardingModel( // OnBoardingModel 2
    title: 'Easy and safe Payment',
    image: AppImageAsset.onBoardingImage2,
    body: 'Easy checkout and safe payment \n method. Trusted by our  customers \n from all over the world',
  ),
  OnBoardingModel( // OnBoardingModel 3
    title: 'Track your Order',
    image: AppImageAsset.onBoardingImage3,
    body: "Best Tracking has been used for \n trac your order. you'll know where \n your order is at the moment"
  ),
  OnBoardingModel( // OnBoardingModel 4
    title: 'Fast Delivery',
    image: AppImageAsset.onBoardingImage4,
    body: 'Reliable and Fast Delivery Service.\n Deliver your Product the fastest \n way possible',
  ),
]; // List of OnBoardingModel to be used in onboarding screen