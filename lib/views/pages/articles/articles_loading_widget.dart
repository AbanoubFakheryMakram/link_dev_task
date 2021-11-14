
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class ArticlesLoadingWidget extends StatelessWidget {
  const ArticlesLoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return SizedBox(height: 20,);
        },
        itemBuilder: (context, index) {
          return FadeShimmer(
            height: 300,
            width: double.infinity,
            radius: 1,
            highlightColor: Color(0xffF9F9FB),
            baseColor: Color(0xffE6E8EB),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
