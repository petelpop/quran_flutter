import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      
    );
  }

  AppBar _appBar() => AppBar(
          title: Row(
            children: [
              SvgPicture.asset('assets/svg/quran_icon.svg'),
              SizedBox(
                width: 16,
              ),
              Text(
                'Quran App',
                style: GoogleFonts.poppins(
                    color: Colors.purple,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/svg/search_icon.svg'))
          ]);

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          _bottomNavigationBarItem(
              icon: 'assets/svg/quran_icon.svg', label: 'Quran'),
          _bottomNavigationBarItem(
              icon: 'assets/svg/doa_icon.svg', label: 'Doa'),
          _bottomNavigationBarItem(
              icon: 'assets/svg/bookmark_icon.svg', label: 'Bookmark'),
        ],
      );

  BottomNavigationBarItem _bottomNavigationBarItem(
          {required String icon, required String label}) =>
      BottomNavigationBarItem(
          icon: SvgPicture.asset(icon),
          activeIcon: SvgPicture.asset(icon),
          label: label);
}
