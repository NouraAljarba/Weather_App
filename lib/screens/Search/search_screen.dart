import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_project/components/app_bar.dart';

import '../../bloc/search_bloc/search_bloc.dart';
import '../../components/city_card.dart';
import '../Details/details_screen.dart';

class SearchScreen extends StatelessWidget {
  final SearchBloc _searchBloc = SearchBloc();

  SearchScreen({super.key}) {
    _searchBloc.add(SearchCityEvent(''));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _searchBloc,
        child: Scaffold(
          appBar: appBarWidget(title: ''),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    _searchBloc.add(SearchCityEvent(value));
                  },
                  decoration: const InputDecoration(
                    labelText: 'Search City',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  bloc: _searchBloc,
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is SearchLoaded) {
                      return ListView.builder(
                        itemCount: state.cities.length,
                        itemBuilder: (context, index) {
                          return CityCard(
                            city: state.cities[index],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                      city: state.cities[index].city!),
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else if (state is SearchError) {
                      return Center(child: Text(state.message));
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
