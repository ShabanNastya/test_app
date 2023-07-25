part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class PostStateLoading extends PostState {
  @override
  List<Object> get props => [];
}

class PostStateSuccess extends PostState {
  final List<Post> posts;

  const PostStateSuccess(this.posts);

  @override
  List<Object> get props => [posts];
}

class PostStateError extends PostState {
  final String error;

  const PostStateError(this.error);

  @override
  List<Object> get props => [error];
}
