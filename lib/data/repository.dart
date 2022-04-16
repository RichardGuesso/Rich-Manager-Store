import 'package:gerenciamento_loja/data/provider.dart';
import 'package:gerenciamento_loja/models/reviews.dart';

class ReviewRepository {
  StoreProvider storeProvider;
  ReviewRepository({required this.storeProvider});

  List<StoreReviews> readReviews() => storeProvider.readReviews();
  Future<void> writeReviews(List<StoreReviews> reviews) async => await storeProvider.writeReview(reviews);

  List<dynamic> readFollowers() => storeProvider.readFollowers();
  Future<void> writeFollowers(List<dynamic> followers) async => await storeProvider.writeFollowers(followers);
}
