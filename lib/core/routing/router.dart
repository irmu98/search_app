import 'package:go_router/go_router.dart';
import 'package:search_app/core/routing/routes.dart';
import 'package:search_app/data/data_source/photo_data_source_impl.dart';
import 'package:search_app/data/repository/photo_repository_impl.dart';
import 'package:search_app/presentation/search_detail/search_detail_screen.dart';
import 'package:search_app/presentation/search_detail/search_detail_view_model.dart';
import 'package:search_app/presentation/search_photo/search_photo_screen.dart';
import 'package:search_app/presentation/search_photo/search_photo_view_model.dart';

final router = GoRouter(
  initialLocation: Routes.search,
  routes: [
    GoRoute(
      path: Routes.search,
      builder:
          (context, state) => SearchPhotoScreen(
            viewModel: SearchPhotoViewModel(
              photoRepository: PhotoRepositoryImpl(
                photoDataSource: PhotoDataSourceImpl(),
              ),
            ),
          ),
    ),
    GoRoute(
      path: Routes.searchDetail,
      builder:
          (context, state) {
            final photoId = int.parse(state.pathParameters['photoId'] ?? '-1');
            return SearchDetailScreen(
              viewModel: SearchDetailViewModel(
                photoRepository: PhotoRepositoryImpl(
                  photoDataSource: PhotoDataSourceImpl(),
                ),
                photoId: photoId,
              ),
            );
          }
    ),
  ],
);
