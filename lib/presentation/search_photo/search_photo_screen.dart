import 'package:flutter/material.dart';
import 'package:search_app/core/routing/routes.dart';
import 'package:search_app/presentation/component/search_photo_card.dart';
import 'package:search_app/presentation/component/search_widget.dart';
import 'package:search_app/presentation/search_photo/search_photo_view_model.dart';
import 'package:go_router/go_router.dart';

class SearchPhotoScreen extends StatelessWidget {
  final SearchPhotoViewModel viewModel;

  const SearchPhotoScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: viewModel..fetchPhotos(),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                SearchWidget(
                  onValueChange: (String value) {
                    viewModel.searchBySearchWidget(value);
                  },
                ),
                SizedBox(height: 30),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    children:
                        viewModel.state.searchPhotos
                            .map(
                              (photo) => SearchPhotoCard(
                                photo: photo,
                                onClick: (int photoId) {
                                  context.push(
                                    Routes.searchDetail.replaceAll(
                                      ':photoId',
                                      photoId.toString(),
                                    ),
                                  );
                                },
                              ),
                            )
                            .toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
