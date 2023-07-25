import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/presentation/post/ui/detail_page.dart';
import 'package:test_app/domain/repository/post_repository.dart';
import 'package:test_app/presentation/post/core/post/post_bloc.dart';

import '../../../domain/models/post.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostBloc(RepositoryProvider.of<PostRepository>(context))
            ..add(LoadPostEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Messages'),
        ),
        body: BlocListener<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostStateError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Error load"),
                  backgroundColor: Colors.redAccent,
                ),
              );
            }
          },
          child: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is PostStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is PostStateSuccess) {
                List<Post> postList = state.posts;
                return ListView.separated(
                  itemCount: postList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(postList[index].title),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              currentPostIndex: postList[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
