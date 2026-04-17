import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/routing/routes.dart';
import 'package:food/core/theme/colors.dart';
import 'package:food/core/utils/app_styles.dart';
import 'package:food/core/utils/extensions.dart';
import 'package:food/features/onboarding/models/onboarding_model.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  bool isLastPage = false;

  List<OnboardingModel> pages = [
    OnboardingModel(
      image: 'assets/lottie/delivery.json', // ملف Lottie لواحد راكب عجلة
      title: 'أسرع دليفري في المنيا',
      desc: 'طلبك هيوصلك من مطعم البرنس سخن وفي أسرع وقت ممكن.',
    ),
    OnboardingModel(
      image: 'assets/lottie/location.json', // ملف Lottie للوكيشن
      title: 'حدد مكانك بدقة',
      desc: 'متقلقش من وصف العنوان، الخريطة هتوصلنا لباب بيتك.',
    ),
    OnboardingModel(
      image: 'assets/lottie/payment.json', // ملف Lottie للدفع
      title: 'ادفع بالطريقة اللي تريحك',
      desc: 'سواء كاش أو كارت، مأمنين لك كل طرق الدفع.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () => context.pushAndRemoveUntil(Routes.loginScreen),
                child: const Text('تخطي', style: TextStyle(color: Colors.grey)),
              ),
            ),

            // Page View Animation
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() => isLastPage = (index == pages.length - 1));
                },
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      pages[index].image,
                      height: 300.h,
                    ), // هنا الأنيميشن
                    SizedBox(height: 40.h),
                    Text(pages[index].title, style: AppStyles.font24BlackBold),
                    Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Text(
                        pages[index].desc,
                        textAlign: TextAlign.center,
                        style: AppStyles.font14GreyRegular,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Points & Btn
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: pages.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: ColorsManager.mainOrange,
                      dotHeight: 8.h,
                      dotWidth: 8.w,
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: ColorsManager.mainOrange,
                    onPressed: () {
                      if (isLastPage) {
                        context.pushAndRemoveUntil(Routes.loginScreen);
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Icon(
                      isLastPage ? Icons.done : Icons.arrow_forward_ios,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

