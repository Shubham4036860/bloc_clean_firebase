import 'package:bloc_with_clean/core/route/route_name.dart';
import 'package:bloc_with_clean/core/theme/color_schemas.dart';
import 'package:bloc_with_clean/features/network/presentation/blocs/network_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NetworkView extends StatelessWidget {
  Widget nextScreen;

  NetworkView({super.key, required this.nextScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state == InternetState.gained) {
            Future.delayed(const Duration(milliseconds: 1000), () {
              GoRouter.of(context).push(loginView);
            });
          } else if (state == InternetState.lost) {
            Scaffold(
                body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.red),
                    child: const Center(
                      child: Text(
                        "!",
                        style: TextStyle(color: Colors.white, fontSize: 60.0, fontWeight: FontWeight.w700),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const Text(
                    "Check Your Network Connectivity",
                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w500),
                    softWrap: true,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    maxLines: 4,
                  )
                ],
              ),
            ));
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state == InternetState.gained) {
            print("check here is if excution");
            Future.delayed(const Duration(milliseconds: 1000), () {
              GoRouter.of(context).push(loginView);
            });
          } else if (state == InternetState.lost) {
            print("check here is excution");
            return Scaffold(
                body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.red),
                    child: const Center(
                      child: Text(
                        "!",
                        style: TextStyle(color: Colors.white, fontSize: 60.0, fontWeight: FontWeight.w700),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const Text(
                    "Check Your Network Connectivity",
                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w500),
                    softWrap: true,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    maxLines: 4,
                  )
                ],
              ),
            ));
          }
          return Center(
              child: CircularProgressIndicator(
            color: primaryColor,
          ));
        },
      ),
    );
  }
}
