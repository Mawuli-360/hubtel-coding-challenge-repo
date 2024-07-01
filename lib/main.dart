// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: child,
        );
      },
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;
  List<String> tabs = ['History', 'Transaction'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Card(
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.h),
          child: SizedBox(
            height: 1.sh,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                Container(
                  height: 55.h,
                  padding: EdgeInsets.symmetric(horizontal: 2.h),
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  color: const Color(0xffE6EAED),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(tabs.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = index;
                          });
                        },
                        child: Container(
                            color: selectedTab == index ? Colors.white : null,
                            width: 153.w,
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Text(
                              tabs[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: selectedTab == index
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            )),
                      );
                    }),
                  ),
                ),
                20.verticalSpace,
                // SizedBox(
                //   height: 50.h,
                //   // color: Colors.red,
                //   child: Row(
                //     children: [
                //       Container(
                //         height: 50.h,
                //         color: Colors.white,
                //         child: TextFormField(
                //           decoration: const InputDecoration(
                //               hintText: 'search', suffixIcon: Icon(Icons.search)),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                Row(
                  children: [
                    Container(
                      width: 290.w,
                      color: const Color(0xffE6EAED),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search'),
                      ),
                    ),
                    Image.asset('assets/images/filter.png')
                  ],
                ),
                20.verticalSpace,

                Container(
                  padding: EdgeInsets.all(8.h),
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
                    color: Color(0xffE6EAED),
                  ),
                  child: Text(
                    'May 24, 2022',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                40.verticalSpace,
                const HistoryCard(
                  custommerName: 'Emmanuel Rockson\nKwabena Uncle Ebo',
                  serviceImage: 'assets/images/mtn.png',
                  number: '024 123 4567',
                  statusIcon: Icons.check,
                  statusMessage: 'successful',
                  color: Color(0xffDBF7E0),
                ),
                20.verticalSpace,
                const HistoryCard(
                  custommerName: 'Absa bank\nKwabena Uncle Ebo',
                  serviceImage: 'assets/images/absa.png',
                  number: '024 123 4567',
                  statusIcon: Icons.close,
                  statusMessage: 'failed',
                  color: Color(0xffFDB0AC),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.custommerName,
    required this.serviceImage,
    required this.number,
    this.isFav = false,
    required this.statusIcon,
    required this.statusMessage,
    required this.color,
  });

  final String custommerName;
  final String serviceImage;
  final String number;
  final bool isFav;
  final IconData statusIcon;
  final String statusMessage;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      padding: EdgeInsets.all(10.h),
      height: 150.h,
      decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(8.h),
          border: Border.all(color: const Color(0xffE6EAED))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '14: 45 PM',
            style: TextStyle(fontSize: 12.sp, color: const Color(0xff9EADBA)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(serviceImage),
                  8.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        custommerName,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      Text(
                        '024 123 4567',
                        style: TextStyle(
                            fontSize: 12.sp, color: const Color(0xff9EADBA)),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  statusCard(
                      icon: statusIcon, message: statusMessage, color: color),
                  5.verticalSpace,
                  Text(
                    'GHS 500',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          const Divider(),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/avatar.png",
                    height: 20.h,
                  ),
                  10.horizontalSpace,
                  Text(
                    'Personal',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  10.horizontalSpace,
                  Container(
                    height: 8.h,
                    width: 8.h,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xff9CABB8)),
                  ),
                  10.horizontalSpace,
                  Text(
                    'Cool your heart wai',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ],
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20.h,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget statusCard({required icon, required message, required color}) {
    return Container(
      padding: EdgeInsets.all(2.h),
      width: 120.w,
      height: 28.h,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: color,
      ),
      child: Row(
        children: [
          10.horizontalSpace,
          CircleAvatar(
            radius: 8.h,
            backgroundColor: Colors.green,
            child: Icon(
              icon,
              size: 12.h,
              color: Colors.white,
            ),
          ),
          5.horizontalSpace,
          Text(
            message,
            style: TextStyle(fontSize: 14.sp, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
