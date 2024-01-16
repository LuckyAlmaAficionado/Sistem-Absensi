import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: SafeArea(
            child: Column(
              children: [
                // informasi jabatan, nama, & photo profile
                Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Get.width * 0.6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lucky Alma Aficionado Rigel',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Asisten Laboratorium Dasar',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                      ),
                    ],
                  ),
                ),

                // custom tile
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTileHome(
                        icon: Icons.face,
                        title: 'Absensi',
                        onTap: () {},
                      ),
                      CustomTileHome(
                        icon: Icons.date_range,
                        title: 'Jadwal',
                        onTap: () {},
                      ),
                      CustomTileHome(
                        icon: Icons.person_search_sharp,
                        title: 'Daftar Aslab',
                        onTap: () {},
                      ),
                      CustomTileHome(
                        icon: Icons.logout,
                        title: 'Keluar',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),

                // riwayat asistensi
                const Gap(20),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(30),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Riwayat Absensi',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            const Gap(10),
                            GestureDetector(
                              onTap: () {
                                Get.defaultDialog(
                                  title: 'Riwayat Absensi',
                                  content: Text(
                                    'berisi mengenai informasi riwayat dari asistensi laboratorium',
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.info_outline,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                        const Gap(20),
                        Expanded(
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(10),
                            child: Center(
                              child: Text(
                                'Tidak ada riwayat',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CustomTileHome extends StatelessWidget {
  const CustomTileHome({
    super.key,
    required this.title,
    this.onTap,
    required this.icon,
  });

  final String title;
  final Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                icon,
                size: 40,
              ),
            ),
            const Gap(10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
