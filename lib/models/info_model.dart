import 'package:equatable/equatable.dart';

class InfoItem extends Equatable {
  final String id;
  final String title;
  final String shortDescription;
  final String longDescription;
  final String category;
  final String imageUrl;

  const InfoItem({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.longDescription,
    required this.category,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [
    id,
    title,
    shortDescription,
    longDescription,
    category,
    imageUrl,
  ];
}
