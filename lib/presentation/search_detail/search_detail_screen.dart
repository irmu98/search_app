import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:search_app/presentation/search_detail/search_detail_view_model.dart';

class SearchDetailScreen extends StatelessWidget {
  final SearchDetailViewModel viewModel;

  const SearchDetailScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: viewModel..fetchData(),
        builder: (context, snapshot) {
          if (viewModel.state.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: viewModel.state.photo.largeImageURL,
                    fit: BoxFit.cover,
                    placeholder:
                        (context, url) => Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('user: ${viewModel.state.photo.user}', style: TextStyle(fontSize: 20),),
                        SizedBox(height: 10),
                        Wrap(
                          children: [Text('tags: ${viewModel.state.photo.tags.join(', ')}', style: TextStyle(fontSize: 20))],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
          );
        },
      ),
    );
  }
}
