import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerWidget extends StatelessWidget {
  @override
  List<String> bannner = <String> [
    'assets/images/banners/banner1.jpeg',
    'assets/images/banners/banner2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    double  width = MediaQuery.of(context).size.width;
    double  height  = width * 540.0 / 1080.0;

    return Container(
      width: width,
      height: height,
      child: Swiper(
        itemBuilder: (BuildContext context, index){
          return Container(
            margin: EdgeInsets.only(left: 5.0,right: 5.0),
            child: Image.asset(
              bannner[index],
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: bannner.length,
        scrollDirection: Axis.horizontal,
        autoplay: true,
      ),
    );

  }


}

