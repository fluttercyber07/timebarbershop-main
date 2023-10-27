// import 'dart:developer';

//
import 'package:flutter/services.dart';
import 'dart:typed_data';

//
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popover/popover.dart';
import 'package:timebarbershop/about_us/products.dart';
import 'package:timebarbershop/constants.dart';
import 'package:timebarbershop/home/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:youtube_player_iframe/youtube_player_iframe.dart';

// import '../order_online/order_online_screen.dart';

class AboutUsScreen extends StatefulWidget {
  static const String id = "efcefweiorucwiruow4r3408t8v04";

  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  // YoutubePlayerController? _ytbPlayerController;
  String youtubeLink = "https://youtu.be/CJd4UoSS3LE";

  @override
  // //
  // Int8List? _bytes;
  // void _getBytes(imageUrl) async {
  //   final ByteData data =
  //       await NetworkAssetBundle(Uri.parse(imageUrl)).load(imageUrl);
  //   setState(() {
  //     _bytes = data.buffer.asInt8List();
  //     print(_bytes);
  //   });
  // }
  // void initState() {
  //   _getBytes(
  //       'https://upwork-usw2-prod-assets-static.s3.us-west-2.amazonaws.com/org-logo/425220847461273600');
  //   super.initState();
  // }

  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     setState(() {
  //       _ytbPlayerController = YoutubePlayerController(
  //         initialVideoId: YoutubePlayerController.convertUrlToId(
  //           youtubeLink,
  //         ).toString(),
  //         params: YoutubePlayerParams(
  //           showFullscreenButton: true,
  //           autoPlay: true,
  //           // color: 'white',
  //           loop: false,
  //           enableJavaScript: true,
  //         ),
  //       );
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF0A0B0F),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.chevron_left,
            size: 28.w,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark, // For Android (light icons)
          statusBarBrightness: Brightness.light, // For iOS (light icons)
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/about_us_header_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 60.h),
                // Text Logo
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 68.w),
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => LinearGradient(colors: [
                      Color(0xff3e50f8),
                      Color(0xff3e50f8).withOpacity(0.8),
                    ]).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: Text(
                      "ONE barbershop".tr().toUpperCase(),
                      style: GoogleFonts.robotoSlab(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Employees".tr(),
                  style: GoogleFonts.robotoSlab(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.lightGray,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Image.asset(
                  'assets/icons/about_us_header_shape.png',
                  width: 124.w,
                  height: 16.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20.h),
                // Youtube Video Section
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 20.w),
                //   child: AspectRatio(
                //     aspectRatio: 16 / 9,
                //     child: _ytbPlayerController == null
                //         ? Center(
                //             child: CircularProgressIndicator(
                //             color: ColorManager.red,
                //           ))
                //         : YoutubePlayerIFrame(controller: _ytbPlayerController),
                //   ),
                // ),
                // SizedBox(height: 20.h),
                // Info
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 24.w),
                //   child: Text(
                //     "У нас есть всё, что требуется настоящему мужчине: атмосфера брутальности и мужского духа, профессионализм барберов и сохранение европейских традиций барберинга, а также отличный кофе и хорошая компания",
                //     style: GoogleFonts.robotoSlab(
                //       fontSize: 14.sp,
                //       fontWeight: FontWeight.w300,
                //       color: ColorManager.lightGray,
                //     ),
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                // SizedBox(height: 4.h),
              ],
            ),
          ),

          // Order online

          // Container(
          //   width: double.infinity,
          //   color: Color(0xFF1E1E1E).withOpacity(0.5),
          //   padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 60.w),
          //   alignment: Alignment.center,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       _ytbPlayerController!.pause();
          //       Navigator.push(
          //         context,
          //         CupertinoPageRoute(
          //           builder: (ctx) => OrderOnlineScreen(),
          //         ),
          //       );
          //     },
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: ColorManager.red,
          //       elevation: 0,
          //       padding: EdgeInsets.symmetric(
          //         // horizontal: 50.w,
          //         vertical: 13.h,
          //       ),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(4.r),
          //       ),
          //     ),
          //     child: Row(
          //       children: [
          //         Expanded(
          //           child: Text(
          //             'Записаться онлайн',
          //             style: GoogleFonts.robotoSlab(
          //               fontSize: 16.sp,
          //               fontWeight: FontWeight.w600,
          //               color: Colors.white,
          //             ),
          //             textAlign: TextAlign.center,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          // Info
          //БАРБЕР
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Image(
                    image: AssetImage("assets/barbers/barber_2.png"),
                  ),
                ),
                Text(
                  "about shoxruh barber".tr(),
                  style: GoogleFonts.robotoSlab(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.lightGray,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Image(
                    image: AssetImage("assets/barbers/barber_3.png"),
                  ),
                ),
                Text(
                  "about sirojiddin barber".tr(),
                  style: GoogleFonts.robotoSlab(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.lightGray,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          /*
          * Text(
                  "ВЫ НЕ УСПЕЕТЕ ЗАМЕТИТЬ, КАК СНОВА ЗАХОТИТЕ ВЕРНУТЬСЯ В НАШ БАРБЕРШОП",
                  style: GoogleFonts.robotoSlab(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.lightGray,
                  ),
                  textAlign: TextAlign.center,
                ),*/
          // Telegram accountga o'tish
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: ElevatedButton(
              onPressed: () async {
                await launch("https://t.me/sad1kovs");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff3e50f8),
              ),
              child: Text(
                "Sign up online".tr(),
                style: GoogleFonts.robotoSlab(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 56),
            child: Text(
              "Shampunlar va conditsionerlar",
              style: GoogleFonts.robotoSlab(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Premium sochni parvarish qilish mahsulotlarini qidiryapsizmi? Sochingizni chiroyli va sog'lom qiladigan shampun va konditsionerlarning professional qatorini sinab ko'ring.",
              style: GoogleFonts.robotoSlab(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: ColorManager.lightGray,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h, bottom: 10),
            height: 320.h,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 30.w,
                ),
                _shampunlar("assets/shampunlar_konditsionerlar/img1.jpg",
                    "Ekrarlar uchun shampun", "254.800"),
                _shampunlar(
                    "assets/shampunlar_konditsionerlar/img2.jpg",
                    "Ayollar uchun sochni parvarish qilish vositasi (davolash)",
                    "254.800"),
                _shampunlar("assets/shampunlar_konditsionerlar/img3.jpg",
                    "Ayollar uchun tiklovchi konditsioner", "254.800"),
                _shampunlar("assets/shampunlar_konditsionerlar/img4.jpg",
                    "Ayollar uchun tiklovchi shampun", "254.800"),
                _shampunlar("assets/shampunlar_konditsionerlar/img5.jpg",
                    "Ayollar uchun tiklovchi shampun", "254.800"),
                _shampunlar("assets/shampunlar_konditsionerlar/img6.jpg",
                    "Ayollar uchun chuqur tozalovchi shampun", "254.800"),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: 30.w),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Batafsil:",
                    style: GoogleFonts.robotoSlab(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
            child: Text(
              "tarif".tr(),
              style: GoogleFonts.robotoSlab(
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: ColorManager.lightGray,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 34.h),
          // Services
          // Service 1
          Container(
            padding: EdgeInsets.symmetric(horizontal: 54.w),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff3e50f8),
                            blurRadius: 5,
                            spreadRadius: 6),
                      ]),
                  child: Image(
                    image: AssetImage("assets/icons/service_4.png"),
                    height: 56.w,
                    width: 56.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 18.h),
                Text(
                  "choy kofe".tr(),
                  style: GoogleFonts.robotoSlab(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.lightGray,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          // Service 2
          Container(
            padding: EdgeInsets.symmetric(horizontal: 54.w),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff3e50f8),
                            blurRadius: 5,
                            spreadRadius: 6),
                      ]),
                  child: Image.asset(
                    'assets/icons/service_5.png',
                    width: 56.w,
                    height: 56.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 18.h),
                Text(
                  "yevropa an'analari".tr(),
                  style: GoogleFonts.robotoSlab(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.lightGray,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          // Service 3
          Container(
            padding: EdgeInsets.symmetric(horizontal: 56.w),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff3e50f8),
                            blurRadius: 5,
                            spreadRadius: 6),
                      ]),
                  child: Image.asset(
                    'assets/icons/service_6.png',
                    width: 56.w,
                    height: 56.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 18.h),
                Text(
                  "qayta kelishni xohlaysiz".tr(),
                  style: GoogleFonts.robotoSlab(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.lightGray,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                SizedBox(height: 18.h),
                Row(
                  children: [
                    Text(
                      "Bizning xizmatlarimiz".tr(),
                      style: GoogleFonts.robotoSlab(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.lightGray,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
                _narxlar("Soch kesish".tr(), "Soch kesish narxi".tr()),
                _narxlar(
                    "Soqol soch turmagi".tr(), "Soqol soch turmagi narxi".tr()),
                _narxlar("Soqolni modellashtirish".tr(),
                    "Soqolni modellashtirish narxi".tr()),
                _narxlar("Qirol soqol".tr(), "Qirol soqol narxi".tr()),
                _narxlar("Soqol depilatsiyalash".tr(),
                    "Soqol depilatsiyalash narxi".tr()),
                _narxlar("Umumiy soqol depilyatsiyasi".tr(),
                    "Umumiy soqol depilyatsiyasi narxi".tr()),
                _narxlar(
                    "Yuzlarni tozalash".tr(), "Yuzlarni tozalash narxi".tr()),
                _narxlar("Ukladka".tr(), "Ukladka narxi".tr()),
                _narxlar("Kantofka qilish".tr(), "Kantofka qilish narxi".tr()),
                _narxlar("10 yoshgacha bo'lgan bolalarning soch turmagi".tr(),
                    "10 yoshgacha bo'lgan bolalarning soch turmagi narxi".tr()),
                _narxlar(
                    "10 yoshdan boshlab".tr(), "10 yoshdan boshlab narxi".tr()),
                _narxlar("Chizma".tr(), "Chizma narxi".tr()),
                _narxlar("Ota+o'g'il 20% chegirma".tr(),
                    "Ota+o'g'il 20% chegirma narxi".tr()),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                SizedBox(height: 35.h),
                Text(
                  "Developed".tr(),
                  style: GoogleFonts.robotoSlab(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.lightGray,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "© ONE Barbershop".tr(),
                  style: GoogleFonts.robotoSlab(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.lightGray,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 84.h),

          // image.memory bytes
          // Container(
          //   margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
          //   child: _bytes == null
          //       ? const CircularProgressIndicator()
          //       : Image.memory(
          //     Uint8List.fromList(_bytes!),
          //     width: 250,
          //     height: 250,
          //     fit: BoxFit.contain,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _narxlar(String xizmat, String narx) {
    return Row(
      children: [
        Container(
          width: 150,
          child: Text(
            xizmat,
            // maxLines: 1,
            // overflow: TextOverflow.ellipsis,
            style: GoogleFonts.robotoSlab(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: ColorManager.lightGray,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(),
        ),
        Text(
          narx,
          style: GoogleFonts.robotoSlab(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorManager.lightGray,
          ),
        ),
      ],
    );
  }

  Widget _shampunlar(String img, String name, String narx) {
    return Container(
      margin: EdgeInsets.only(right: 20, top: 5, bottom: 5),
      height: 310.h,
      width: 160.w,
      decoration: BoxDecoration(
        color: Color(0xff111827),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xff3b82f6),
            blurRadius: 5,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5.h),
            height: 150.h,
            width: 160.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(img),
              ),
            ),
          ),
          Center(
            child: Text("Shampunlar va\nKonditsionerlar".toUpperCase(),
                style: GoogleFonts.robotoSlab(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.gray,
                )),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 2.h),
            child: Text(
              name,
              style: GoogleFonts.robotoSlab(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Container(
            // margin: EdgeInsets.only(left: 7.w, right: 7.w, top: 7),
            child: Text(narx + "narx".tr(),
                style: GoogleFonts.robotoSlab(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                  child: PopupMenuButton(
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        child: Container(
                          child: Text("ddsfdsfsdewwwwwwwwwwwwwwwww"
                              "wwwwwwwrwerwerwerwerwerwvgteter"
                              "tverdfgvrvrderwerwerwer"),
                        ),
                      ),
                    ],
                    color: ColorManager.gray,
                    child: Text(
                      "Tafsilotlar",
                      style: GoogleFonts.robotoSlab(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Container(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shop),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
