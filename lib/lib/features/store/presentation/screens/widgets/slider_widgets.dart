import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round/features/store/presentation/screens/bloc/main_home_cubit/main_home_cubit.dart';
import 'package:round/features/store/presentation/screens/bloc/main_home_cubit/main_home_state.dart';
import 'package:shimmer/shimmer.dart';

class SliderWidgets extends StatelessWidget {
  const SliderWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainHomeCubit, MainHomeState>(
      builder: (context, state) {
        if (state is HomeMainLoaded) {
          return Container(
            height: 161,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                aspectRatio: 343 / 161,
                initialPage: 0,
                scrollPhysics: ClampingScrollPhysics(),
                height: 161,
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
              items: state.mainHomeModel.slides!.map<Widget>((e) {
                return InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          e.image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        } else if (state is HomeMainLoading) {
          return Container(
            height: 161,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Shimmer.fromColors(
                baseColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[900]!
                    : Colors.grey[300]!,
                highlightColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[800]!
                    : Colors.grey[100]!,
                direction: ShimmerDirection.rtl,
                enabled: true,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
