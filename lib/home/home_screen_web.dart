import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timebarbershop/constants.dart';
import 'package:timebarbershop/order_online/order_online_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../choose_branch/choose_branch_screen.dart';

class WebHomeScreen extends StatefulWidget {
  const WebHomeScreen({Key? key}) : super(key: key);

  @override
  State<WebHomeScreen> createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen>
    with TickerProviderStateMixin {
  final appStoreLink =
      "https://apps.apple.com/ru/app/time-barbershop/id6444368769";
  final playStoreLink =
      "https://play.google.com/store/apps/details?id=com.asadbekdev.timebarbershop";
  YoutubePlayerController? _ytbPlayerController;
  String youtubeLink = "https://youtu.be/CJd4UoSS3LE";

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _ytbPlayerController = YoutubePlayerController(
          initialVideoId: YoutubePlayerController.convertUrlToId(
            youtubeLink,
          ).toString(),
          params: YoutubePlayerParams(
            showFullscreenButton: true,
            autoPlay: false,
            loop: false,
            enableJavaScript: true,
          ),
        );
      });
    });
    super.initState();
  }

  List publicRoomServices = [
    ["Стрижка волос", "70.000-100.000сум"],
    ["Стрижка Бороди", "50.000сум"],
    ["Моделирование бороди", "100.000сум"],
    ["Королевское бритё", "100.000сум"],
    ["Депиляция контра бороди", "50.000сум"],
    ["Обшая Депиляция бороди", "100.000сум"],
    ["Чистак лица", "50.000-100.000сум"],
    ["Укладка", "50.000-100.000сум"],
    ["Окантовка", "50.000сум"],
    ["Децкая стрижка до 10 лет", "50.000сум"],
    ["c 10 лет", "70.000сум"],
    ["Рисунок", "25.000-50.000сум"],
    ["Папа+син 20% скидка", "сум"],
  ];
  List privateRoomServices = [
    ["Стрижка", "150.000сум"],
    ["Стрижка Бороди", "100.000сум"],
    ["Моделирование бороди", "150.000сум"],
    ["Королевское бритё", "100.000сум"],
    ["Чистак лица", "100.000-120.000сум"],
    ["Децкая стрижка до 10 лет", "120.000сум"],
    ["Виезд от 300.000 сум для взрослих", ""],
    ["Для детей 200.000 сум", ""],
  ];

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0B0F),
      body: Theme(
        data: Theme.of(context).copyWith(
          scrollbarTheme: ScrollbarThemeData(
            trackColor: MaterialStateProperty.all(Colors.white),
            thumbColor: MaterialStateProperty.all(Colors.red),
          ),
        ),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          trackVisibility: true,
          interactive: true,
          child: ListView(
            controller: _scrollController,
            shrinkWrap: true,
            children: [
              // Header
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/web_bg_2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo and About US Button
                    Image.asset(
                      'assets/logo_white.png',
                      fit: BoxFit.cover,
                      width: 165,
                      height: 56,
                    ),
                    SizedBox(height: 70.h),

                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) => LinearGradient(colors: [
                        Colors.white,
                        Colors.white70,
                      ]).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                      child: Text(
                        "сеть\nбарбершопов".toUpperCase(),
                        style: GoogleFonts.robotoSlab(
                          fontSize: 56.sp,
                          fontWeight: FontWeight.w700,
                          // color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: 150.h),
                    // const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                Uri _url = Uri.parse(
                                    "https://n773195.alteg.io/group:711675/city:all#1");
                                if (!await launchUrl(_url)) {
                                  throw 'Could not launch $_url';
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color(0xFF1E1E1E).withOpacity(0.8),
                                elevation: 0,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 33.h,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: SizedBox(
                                width: 300,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/location.svg'),
                                    // SizedBox(width: 12),
                                    Text(
                                      'Выберите филиал',
                                      style: GoogleFonts.robotoSlab(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                        'assets/icons/arrow_down.svg'),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15.h),
                            ElevatedButton(
                              onPressed: () async {
                                Uri _url = Uri.parse(
                                    "https://n773195.alteg.io/company:726327#1");
                                if (!await launchUrl(_url)) {
                                  throw 'Could not launch $_url';
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorManager.red,
                                elevation: 0,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 33.h,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: SizedBox(
                                width: 300,
                                child: Center(
                                  child: Text(
                                    'Записаться онлайн',
                                    style: GoogleFonts.robotoSlab(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 150.h),
                  ],
                ),
              ),

              // Applications Stores
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
                decoration: BoxDecoration(
                  color: Color(0xFF0A0B0F),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // MockUP Image
                    Image.asset(
                      'assets/mockup.png',
                      width: 600,
                      height: 600,
                      fit: BoxFit.cover,
                    ),

                    // Application Store Buttons
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Text(
                              "Установите специальное мобильное приложение для удобной онлайн–записи",
                              style: GoogleFonts.robotoSlab(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 1.4,
                              ),
                              maxLines: 4,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 150.h),
                          ElevatedButton(
                            onPressed: () async {
                              Uri _url = Uri.parse(playStoreLink);
                              if (!await launchUrl(_url)) {
                                throw 'Could not launch $_url';
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 33.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(33),
                              ),
                              side: BorderSide(color: Colors.red, width: 3),
                            ),
                            child: SizedBox(
                              width: 300,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/google_play.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Google Play',
                                    style: GoogleFonts.robotoSlab(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          ElevatedButton(
                            onPressed: () async {
                              Uri _url = Uri.parse(appStoreLink);
                              if (!await launchUrl(_url)) {
                                throw 'Could not launch $_url';
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 33.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(33),
                              ),
                              side: BorderSide(color: Colors.red, width: 3),
                            ),
                            child: SizedBox(
                              width: 300,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/apple_store.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Apple Store',
                                    style: GoogleFonts.robotoSlab(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // YouTube Section
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
                    SizedBox(height: 50.h),
                    // Text Logo
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) => LinearGradient(colors: [
                        Color(0xFFEC1C24),
                        Color(0xFFEC1C24).withOpacity(0.8),
                      ]).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                      child: Text(
                        "Time Барбершоп".toUpperCase(),
                        style: GoogleFonts.robotoSlab(
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "с твоим характером",
                      style: GoogleFonts.robotoSlab(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.lightGray,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 60.h),

                    //Youtube Video Section
                    Row(
                      children: [
                        // Info
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              "У нас есть всё, что требуется настоящему мужчине: атмосфера брутальности и мужского духа, профессионализм барберов и сохранение европейских традиций барберинга, а также отличный кофе и хорошая компания",
                              style: GoogleFonts.robotoSlab(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w300,
                                color: ColorManager.lightGray,
                              ),
                              maxLines: 4,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                        // Youtube Player
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(right: 20.w),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: _ytbPlayerController == null
                                  ? Center(
                                      child: CircularProgressIndicator(
                                          color: ColorManager.red))
                                  : YoutubePlayerIFrame(
                                      aspectRatio: 16 / 9,
                                      controller: _ytbPlayerController,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    // SizedBox(height: 20.h),
                  ],
                ),
              ),

              // Order online
              Container(
                width: double.infinity,
                color: Color(0xFF1E1E1E).withOpacity(0.5),
                padding: EdgeInsets.symmetric(vertical: 40.h),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    _ytbPlayerController!.pause();
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (ctx) => OrderOnlineScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.red,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      // horizontal: 50.w,
                      vertical: 33.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Container(
                    width: 300,
                    alignment: Alignment.center,
                    child: Text(
                      'Записаться онлайн',
                      style: GoogleFonts.robotoSlab(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              // Info
              SizedBox(height: 40.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: Text(
                  "Time Barbershop —  Это место, где Вам помогут найти свой собственный, неповторимый стиль. Стоит довериться мастерам Time один раз, и, поверьте, новый образ не оставит Вас равнодушным. Мужские стрижки и опасное бритье — это наш профиль, и мы уверены, что наши барберы делают это лучше всех. Как сказал однажды знаменитый Ральф Лорен: «Какой бы Вы образ жизни ни вели, у вас должен быть свой собственный стиль, свой собственный мир». Обещать, конечно, что мы сделаем из Вас Кэри Гранта мы не будем, но Вы можете быть уверены в 3-х вещах:",
                  style: GoogleFonts.robotoSlab(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w300,
                    color: ColorManager.lightGray,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 50.h),

              // Services
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 10.w),
                  // Service 1
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/service_1.png',
                          width: 48.w,
                          height: 48.w,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 18.h),
                        Text(
                          "ВАМ ОБЯЗАТЕЛЬНО ПРЕДЛОЖАТ ЧАШЕЧКУ АРОМАТНОГО КОФЕ ИЛИ ЧАЯ",
                          style: GoogleFonts.robotoSlab(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorManager.lightGray,
                            height: 1.4,
                          ),
                          maxLines: 4,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  // Service 2
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/service_2.png',
                          width: 48.w,
                          height: 48.w,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 18.h),
                        Text(
                          "МЫ ПОСТРИЖЕМ И ПОБРЕЕМ ВАС НА ВЫСШЕМ УРОВНЕ ПО ВСЕМ ЕВРОПЕЙСКИМ ТРАДИЦИЯМ",
                          style: GoogleFonts.robotoSlab(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorManager.lightGray,
                          ),
                          maxLines: 4,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  // Service 3
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/service_3.png',
                          width: 48.w,
                          height: 48.w,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 18.h),
                        Text(
                          "ВЫ НЕ УСПЕЕТЕ ЗАМЕТИТЬ, КАК СНОВА ЗАХОТИТЕ ВЕРНУТЬСЯ В НАШ БАРБЕРШОП",
                          style: GoogleFonts.robotoSlab(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorManager.lightGray,
                          ),
                          maxLines: 4,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
              SizedBox(height: 70.h),

              // Services List
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Public Room Services
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Обший зал",
                            style: GoogleFonts.robotoSlab(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.lightGray,
                              height: 1.4,
                            ),
                          ),
                          SizedBox(height: 30.h),
                          ListView.separated(
                            itemCount: publicRoomServices.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              List singleService = publicRoomServices[index];
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    // "Strijka Volos",
                                    singleService[0],
                                    style: GoogleFonts.robotoSlab(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.lightGray,
                                      height: 1.4,
                                    ),
                                    maxLines: 4,
                                  ),
                                  Text(
                                    // "70.000-100.000 sum",
                                    singleService[1],
                                    style: GoogleFonts.robotoSlab(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.lightGray,
                                      height: 1.4,
                                    ),
                                    maxLines: 4,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (ctx, index) {
                              return SizedBox(height: 10.h);
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 1, child: SizedBox()),
                    // Private Room Services
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "VIP зал",
                            style: GoogleFonts.robotoSlab(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.lightGray,
                              height: 1.4,
                            ),
                          ),
                          SizedBox(height: 30.h),
                          ListView.separated(
                            itemCount: privateRoomServices.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              List singleService = privateRoomServices[index];
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    // "Strijka Volos",
                                    singleService[0],
                                    style: GoogleFonts.robotoSlab(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.lightGray,
                                      height: 1.4,
                                    ),
                                    maxLines: 4,
                                  ),
                                  Text(
                                    // "70.000-100.000 sum",
                                    singleService[1],
                                    style: GoogleFonts.robotoSlab(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.lightGray,
                                      height: 1.4,
                                    ),
                                    maxLines: 4,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (ctx, index) {
                              return SizedBox(height: 10.h);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(height: 70.h),
              // Development info
              Text(
                "Pазработчик SHOHRUX EGAMOV\nTelegram: @HUGOChange",
                style: GoogleFonts.robotoSlab(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.lightGray,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Text(
                "© Time Barbershop | ${DateTime.now().year} all rights reserved",
                style: GoogleFonts.robotoSlab(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.lightGray,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
