import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/domain/repository/post_repository.dart';
import '../../../../domain/models/post.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;

  PostBloc(this._postRepository) : super(PostStateLoading()) {
    on<LoadPostEvent>(
      (event, emit) async {
        emit(PostStateLoading());
        try {
          final posts = await _postRepository.showAllPosts();
          emit(PostStateSuccess(posts));
        } catch (e) {
          emit(PostStateError(e.toString()));
        }
      },
    );
  }
}
