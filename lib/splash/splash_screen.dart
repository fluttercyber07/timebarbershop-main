import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timebarbershop/constants.dart';

class SplashScreen extends StatelessWidget {
  final Widget? child;
  const SplashScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      Future.delayed(
        const Duration(seconds: 5),
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => child!),
          );
        },
      );
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              'assets/animated_logo.gif',
              width: 236.w,
              fit: BoxFit.cover,
            ),
            const Spacer(),
            // Text(
            //   "10%",
            //   style: GoogleFonts.oswald(
            //     fontSize: 24.sp,
            //     fontWeight: FontWeight.w500,
            //     color: ColorManager.darkBlue,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            // SizedBox(height: 16.h),
            Center(child: CircularProgressIndicator(color: ColorManager.red)),
            SizedBox(height: 16.h),
            Text(
              "Загружается...",
              style: GoogleFonts.robotoSlab(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: ColorManager.gray,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
