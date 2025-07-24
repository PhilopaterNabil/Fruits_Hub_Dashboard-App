part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState extends Equatable {}

final class AddProductInitial extends AddProductState {
  @override
  List<Object?> get props => [];
}

final class AddProductLoading extends AddProductState {
  @override
  List<Object?> get props => [];
}

final class AddProductSuccess extends AddProductState {
  @override
  List<Object?> get props => [];
}

final class AddProductFailure extends AddProductState {
  final String errMessage;

  AddProductFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}
