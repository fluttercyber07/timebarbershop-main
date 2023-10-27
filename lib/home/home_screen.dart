import 'dart:developer';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:popover/popover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timebarbershop/about_us/about_us_screen.dart';
import 'package:timebarbershop/constants.dart';
import 'package:timebarbershop/order_online/order_online_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../choose_branch/choose_branch_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final websiteUri = Uri.parse("https://t.me/sad1kovs");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    log('lang');
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        context.setLocale(Locale('ru', "RU"));
                        Navigator.pop(context);
                      });
                    },
                    child: Text(
                      "Русский",
                      style: GoogleFonts.robotoSlab(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        context.locale = Locale("uz", "UZ");
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      "O'zbek",
                      style: GoogleFonts.robotoSlab(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        context.locale = Locale("en", "US");
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      "English",
                      style: GoogleFonts.robotoSlab(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ],
              color: Color(0xff3e50f8),
              icon: Icon(Icons.language),
              iconSize: 30,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark, // For Android (light icons)
          statusBarBrightness: Brightness.light, // For iOS (light icons)
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home_bg13.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              if (Platform.isAndroid)
                SizedBox(height: 50.h)
              else
                SizedBox(height: 45.h),
              SizedBox(
                width: 20.w,
              ),

              Image(
                image: AssetImage("assets/barbershop_logo.png"),
                width: 167.w,
                height: 167.w,
                fit: BoxFit.cover,
              ),

              // Image.asset(
              //   "assets/barbershop_logo.png",
              //   width: 167.w,
              //   height: 58.h,
              //   fit: BoxFit.cover,
              // ),
              SizedBox(height: 24.h),
              Center(
                child: Text(
                  "barber shop".tr(),
                  style: GoogleFonts.robotoSlab(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // SizedBox(
              //   width: 312.w,
              //   child: ShaderMask(
              //     blendMode: BlendMode.srcIn,
              //     shaderCallback: (bounds) => LinearGradient(colors: [
              //       Colors.white,
              //       Colors.white70,
              //     ]).createShader(
              //       Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              //     ),
              //     child: Text(
              //       "сеть барбершопов".toUpperCase(),
              //       style: GoogleFonts.robotoSlab(
              //         fontSize: 36.sp,
              //         fontWeight: FontWeight.w700,
              //         color: Colors.white,
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // ),
              const Spacer(),
              // Choose branch
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       CupertinoPageRoute(
              //         builder: (ctx) => ChooseBranchScreen(),
              //       ),
              //     );
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Color(0xFF1E1E1E).withOpacity(0.8),
              //     elevation: 0,
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 16.w,
              //       vertical: 13.h,
              //     ),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(4.r),
              //     ),
              //   ),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       SvgPicture.asset(
              //         'assets/icons/location.svg',
              //         width: 20.w,
              //         height: 20.w,
              //       ),
              //       SizedBox(width: 12.w),
              //       Text(
              //         'Выберите филиал',
              //         style: GoogleFonts.robotoSlab(
              //           fontSize: 16.sp,
              //           fontWeight: FontWeight.w400,
              //           color: Colors.white,
              //         ),
              //       ),
              //       SizedBox(width: 26.w),
              //       SvgPicture.asset(
              //         'assets/icons/arrow_down.svg',
              //         width: 16.w,
              //         height: 16.w,
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 12.h),
              // Order online
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       CupertinoPageRoute(
              //         builder: (ctx) => OrderOnlineScreen(),
              //       ),
              //     );
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: ColorManager.red,
              //     elevation: 0,
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 50.w,
              //       vertical: 13.h,
              //     ),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(4.r),
              //     ),
              //   ),
              //   child: Text(
              //     'Записаться онлайн',
              //     style: GoogleFonts.robotoSlab(
              //       fontSize: 16.sp,
              //       fontWeight: FontWeight.w600,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              // SizedBox(height: 24.h),
              Container(
                width: 180.w,
                child: ElevatedButton(
                  onLongPress: () {
                    launch("tel:+998908079782");
                  },
                  child: Text(
                    "+998908079782",
                    style: GoogleFonts.robotoSlab(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.blue.withOpacity(0.5),
                  ),
                  onPressed: () {},
                ),
              ),
              GestureDetector(
                onTap: () async {
                  const url = "https://t.me/sad1kovs";
                  await launch(url);
                },
                // child: GlassContainer(
                //   height: 50.h,
                //   width: 180.w,
                //   blur: 3,
                //   color: ColorManager.blue.withOpacity(0.1),
                //   gradient: LinearGradient(
                //     begin: Alignment.topLeft,
                //     end: Alignment.bottomRight,
                //     colors: [
                //       ColorManager.blue.withOpacity(0.2),
                //       ColorManager.blue.withOpacity(0.3),
                //     ],
                //   ),
                //   //--code to remove border
                //   border: Border.fromBorderSide(BorderSide.none),
                //   shadowStrength: 5,
                //   shape: BoxShape.circle,
                //   borderRadius: BorderRadius.circular(16),
                //   shadowColor: Colors.blue.withOpacity(0.24),

                child: Container(
                  width: 180.w,
                  decoration: BoxDecoration(
                      color: ColorManager.blue.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(7)),
                  child: Text(
                    "Sign up online",
                    style: GoogleFonts.robotoSlab(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ).tr(),
                ),
                // onPressed: () {
                //   setState(() {
                //     launchUrl(websiteUri, mode: LaunchMode.externalApplication,);
                //   });
                // },
                // child: Icon(Icons.telegram),
              ),
              SizedBox(
                height: 7.h,
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (ctx) => AboutUsScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'More about us',
                    style: GoogleFonts.robotoSlab(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ).tr(),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
