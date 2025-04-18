import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:search_app/data/data_source/photo_data_source.dart';
import 'package:search_app/data/data_source/photo_data_source_impl.dart';
import 'package:search_app/data/repository/photo_repository_impl.dart';
import 'package:search_app/domain/repository/photo_repository.dart';
import 'package:search_app/domain/use_case/search_by_search_widget.dart';
import 'package:search_app/presentation/search_photo/search_photo_state.dart';
import 'package:search_app/presentation/search_photo/search_photo_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<PhotoDataSource>(PhotoDataSourceImpl());
  getIt.registerSingleton<PhotoRepository>(PhotoRepositoryImpl(photoDataSource: getIt()));
  getIt.registerSingleton(SearchBySearchWidget(photoRepository: getIt()));

  getIt.registerFactory(() => SearchPhotoViewModel(photoRepository: getIt(), searchBySearchWidget: getIt()));
}