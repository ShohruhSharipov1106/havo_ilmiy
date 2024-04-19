import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:havo_ilmiy/assets/colors/colors.dart';
import 'package:havo_ilmiy/features/home/domain/entities/weather_entity.dart';
import 'package:havo_ilmiy/features/home/presentation/blocs/weather_bloc/weather_bloc.dart';

class SearchCity extends StatefulWidget {
  const SearchCity({super.key});
  @override
  State<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                ),
                onSubmitted: (value) =>
                    context.read<WeatherBloc>().add(SetCity(city: value)),
              ),
            ),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text('Qidirish',
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ),
              onTap: () {
                FocusScope.of(context).unfocus();
                context
                    .read<WeatherBloc>()
                    .add(SetCity(city: _searchController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
