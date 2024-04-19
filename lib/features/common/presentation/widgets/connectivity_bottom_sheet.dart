import 'package:havo_ilmiy/assets/colors/colors.dart';
import 'package:havo_ilmiy/assets/constants/icons.dart';
import 'package:havo_ilmiy/features/common/presentation/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:havo_ilmiy/features/common/presentation/widgets/w_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

showConnectionBottomSheet(BuildContext context) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
      isDismissible: false,
      context: context,
      builder: (c) {
        return const ConnectionBottomSheet();
      });
}

class ConnectionBottomSheet extends StatelessWidget {
  const ConnectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: BlocListener<ConnectivityBloc, ConnectivityState>(
          listener: (context, state) {
            if (state.connected) {
              Navigator.pop(context);
            }
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(
                20, 64, 20, 24 + MediaQuery.of(context).padding.bottom),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.noInternet,
                      width: 150,
                      height: 150,
                    )
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Офлайн режим',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Нет связи с интернетом. Проверьте подключение к интернету и попробуйте еще раз.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.grey),
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                WButton(
                  onTap: () {},
                  height: 40,
                  text: 'Повторить',
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      );
}
