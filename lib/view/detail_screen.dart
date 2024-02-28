import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/model/surah.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.nomorSurah});

  final int nomorSurah;

  Future<Surah> _detailSurah() async {
    var response = await Dio().get('https://equran.id/api/surat/$nomorSurah');
    return Surah.fromJson(json.decode(response.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _detailSurah(), 
      builder: ((context,snapshot) {
        // init data from response to model
        if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
        Surah surah = snapshot.data!;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: _appBar(context: context, surah: surah),
          body: NestedScrollView(headerSliverBuilder: ((context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: _detail(context: context, surah: surah),
            )
          ]), body: Container()),
        );
      }));
  }

  Padding _detail({required BuildContext context, required Surah surah}) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Stack(
      children: [
        Text(surah.namaLatin.toString())
      ],
    ),
  );

  AppBar _appBar({required BuildContext context, required Surah surah}) => AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    // hide the back button
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        IconButton(
          // to make a button back to the prev page when pressed
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/svg/back_icon.svg')),
          const SizedBox(width: 24),
          Text(
            surah.namaLatin.toString(),
            style: GoogleFonts.poppins(
              color: const Color(0xFF672CBC),
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          )
      ],
    ),
  );
}