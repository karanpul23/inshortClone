// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inshorts_assignment_karan/bloc/serach_feed/search_feed_bloc.dart';
import 'package:inshorts_assignment_karan/bloc/serach_feed/search_feed_event.dart';
import 'package:inshorts_assignment_karan/bloc/serach_feed/search_feed_state.dart';
import 'package:inshorts_assignment_karan/common/typography/typography.dart';
import 'package:inshorts_assignment_karan/l10n/l10n.dart';
import 'package:inshorts_assignment_karan/modules/search_screen/widget/search_news_card.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Theme.of(context).cardColor,
          title: TextField(
            autofocus: true,
            controller: _searchController,
            textInputAction: TextInputAction.search,
            style: InShortTextStyle.searchbar,
            decoration: InputDecoration(
              hintText:
                  context.l10n.search_message,
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.close
                ),
                onPressed: () => _searchController.clear(),
              ),
              hintStyle: InShortTextStyle.searchbar.copyWith(),
            ),
            onSubmitted: (s) {
              BlocProvider.of<SearchFeedBloc>(context)
                ..add(
                    FetchNewsBySearchQueryEvent(query: _searchController.text));
            },
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_left,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocBuilder<SearchFeedBloc, SearchFeedState>(
          builder: (context, state) {
            if (state is SearchFeedInitialState) {
              return Container();
            } else if (state is SearchFeedLoadingState) {
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text(
                      context.l10n.loading_message,
                      style: InShortTextStyle.searchbar,
                    )
                  ]));
            } else if (state is SearchFeedLoadedState) {
              if (state.news.length == 0) {
                return Center(
                    child: Text(
                  "${context.l10n.not_found}\n",
                  style: InShortTextStyle.newsTitle,
                ));
              }
              return ListView.builder(
                itemCount: state.news.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return SearchNewsCard(
                    articles: state.news,
                    index: index,
                  );
                },
              );
            } else if (state is SearchFeedErrorState) {
              return Container(
                padding: const EdgeInsets.all(16),
                height: double.maxFinite,
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      context.l10n.error,
                      style: InShortTextStyle.newsTitle,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'error_message',
                      style: InShortTextStyle.searchbar,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
