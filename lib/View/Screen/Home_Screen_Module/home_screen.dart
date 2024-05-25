import 'package:auto_route/auto_route.dart';
import 'package:tour_destiny/Bloc/Home_Bloc/home_bloc.dart';
import 'package:tour_destiny/Models/Repository/tours_list.dart';
import 'package:tour_destiny/Models/services/local_storage_service/local_storage_service.dart';
import 'package:tour_destiny/Models/services/network_response/status.dart';
import 'package:tour_destiny/View/widget/home_app_bar.dart';
import 'package:tour_destiny/routes/routes_imports.gr.dart';
import 'package:tour_destiny/utils/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tour_destiny/utils/constant/data_status.dart';
import 'package:tour_destiny/utils/constant/theme_container.dart';

import '../../../utils/constant/no_internet.dart';
import '../../widget/place_bottom.dart';
import '../../widget/tours_tiles.dart';

@immutable
@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 68),
        child: HomeAppBarWidget(),
      ),
      body: Padding(
        padding: kStandardPadding(),
        child: SingleChildScrollView(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return CustomDataStatusWidget(
                  status: state.topFiveResponse.Datastatus!,
                  loadingStatus: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        child: Shimmer.fromColors(
                          baseColor: LocalStorageService.read(
                                      LocalStorageKeys.appTheme) ==
                                  'light'
                              ? Colors.grey[300]!
                              : Colors.black,
                          highlightColor: LocalStorageService.read(
                                      LocalStorageKeys.appTheme) ==
                                  'light'
                              ? Colors.grey[100]!
                              : const Color.fromARGB(255, 69, 69, 69),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5, // Adjust the item count as needed
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: ThemeContainer(
                                  // decoration: BoxDecoration(borderRadius: Bord),
                                  width: 150,
                                  height: 180,
                                  // color: Colors.grey[300],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      LSizedBox(),
                      SizedBox(
                        height: 50,
                        child: Shimmer.fromColors(
                          baseColor: LocalStorageService.read(
                                      LocalStorageKeys.appTheme) ==
                                  'light'
                              ? Colors.grey[300]!
                              : Colors.black,
                          highlightColor: LocalStorageService.read(
                                      LocalStorageKeys.appTheme) ==
                                  'light'
                              ? Colors.grey[100]!
                              : const Color.fromARGB(255, 69, 69, 69),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5, // Adjust the item count as needed
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: ThemeContainer(
                                  // decoration: BoxDecoration(borderRadius: Bord),
                                  width: 150,
                                  height: 50,
                                  // color: Colors.grey[300],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      LSizedBox(),
                      Column(
                        children: tourList.map((e) {
                          return Shimmer.fromColors(
                            baseColor: LocalStorageService.read(
                                        LocalStorageKeys.appTheme) ==
                                    'light'
                                ? Colors.grey[300]!
                                : Colors.black,
                            highlightColor: LocalStorageService.read(
                                        LocalStorageKeys.appTheme) ==
                                    'light'
                                ? Colors.grey[100]!
                                : const Color.fromARGB(255, 69, 69, 69),
                            child: Column(
                              children: [
                                ThemeContainer(
                                  height: 200,
                                  width: double.infinity,
                                ),
                                kSizedBox()
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  successStatus: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTopFiveSection(context, state),
                      kSizedBox(),
                      _buildTourList(tourList, context),
                      sSizedBox(),
                      _buildTourDetailsList(context, state),
                    ],
                  ),
                  checkResponse:state.topFiveResponse.data ,
                  errorStatus: 
                  Text(state.topFiveResponse.message.toString()));
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildTopFiveSection(BuildContext context, HomeState state) {
  switch (state.topFiveResponse.Datastatus) {
    case DataStatus.Loading:
      return SizedBox(
        height: 30,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[100]!,
          highlightColor: Colors.grey[200]!,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, // Adjust the item count as needed
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: ThemeContainer(
                  // decoration: BoxDecoration(borderRadius: Bord),
                  width: 100,
                  height: 150,
                  // color: Colors.grey[300],
                ),
              );
            },
          ),
        ),
      );

    case DataStatus.Error:
     
      return Text(state.topFiveResponse.message.toString());

    case DataStatus.Completed:
      return SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.topFiveResponse.data?.data?.length ?? 0,
          itemBuilder: (context, index) {
            final tourData = state.topFiveResponse.data?.data?[index];

            return Padding(
              padding: const EdgeInsets.only(right: 15),
              child: ToursTiles(
                // onTap: (){
                //    AutoRouter.of(context).push(DetailsScreenRoute(
                // des: tourData!.id,
                // image: tourData.imageCover,
                // name: tourData.name,

                // ratings: tourData.ratingsAverage.toString(),
                // price: tourData.price.toString()));
                // },
                bottomLeft: Text(
                  tourData?.name ?? 'n/a',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: kWhiteBoldTextStyle().copyWith(color: whiteColor),
                ),
                image: '$tours_url/${tourData?.imageCover}' ??
                    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                topRight: Icon(
                  Icons.bookmark_outline,
                  color: whiteColor,
                ),
              ),
            );
          },
        ),
      );
    default:
      null;

      return Container();
  }
}

// Function to build the horizontal tour list
Widget _buildTourList(List<String> tourList, BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: tourList.map((e) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
          child: PlaceBottom(
            onTap: () {
              context
                  .read<HomeBloc>()
                  .add(OnSelectedIndexEvent(selectedIndex: e));
            },
            name: e,
          ),
        );
      }).toList(),
    ),
  );
}

// Function to build the list of tour details
Widget _buildTourDetailsList(BuildContext context, HomeState state) {
  final toursData = state.apiResponse.data?.data;
  if (toursData == null) return Container();

  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: toursData.length,
    itemBuilder: (context, index) {
      final tour = toursData[index];
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ToursTiles(
          height: 250,
          width: double.infinity,
          bottomLeft: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tour.name ?? 'N/A',
                style: kkWhiteBoldTextStyle(),
              ),
              Text(
                tour.description ?? 'n/a',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: sWhiteTextStyle().copyWith(color: whiteColor),
              ),
            ],
          ),
          topLeft: Row(
            children: [
              Icon(
                Icons.star,
                color: whiteColor,
              ),
              minWidthSpan(),
              Text(
                tour.rating?.toString() ?? 'n/a',
                style: kkWhiteBoldTextStyle(),
              ),
            ],
          ),
          bottomRight: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: whiteColor,
                    size: 18,
                  ),
                  Text(
                    tour.maxGroupSize?.toString() ?? 'n/a',
                    style: kWhiteBoldTextStyle().copyWith(color: whiteColor),
                  ),
                ],
              ),
              Text(
                '\$ ${tour.price}',
                style: kkWhiteBoldTextStyle(),
              ),
            ],
          ),
          onTap: () {
            AutoRouter.of(context).push(DetailsScreenRoute(
                des: tour.description,
                image: tour.imageCover,
                name: tour.name,
                imageList: tour.images,
                ratings: tour.rating.toString(),
                price: tour.price.toString()));
          },
          image: '$tours_url/${tour.imageCover}',
          topRight: Icon(
            Icons.bookmark_outline,
            color: whiteColor,
          ),
        ),
      );
    },
  );
}
