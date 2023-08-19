import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/user/login_provider_user.dart';
import 'package:glossy_flossy/provider/user/service_history_provider.dart';
import 'package:glossy_flossy/screen/user/service_history_screen/widgets/service_card_design.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:provider/provider.dart';

class ServiceHistoryScreen extends StatelessWidget {
  const ServiceHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId =
        Provider.of<AuthProvider>(context, listen: false).getUserId();
    Provider.of<ServiceHistoryProvider>(context, listen: false)
        .getServiceData(userId.toString());
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            title: Text('Service History'),
          ),
          Consumer<ServiceHistoryProvider>(
            builder: (context, serviceHistoryProvider, child) {
              return serviceHistoryProvider.isServiceHistoryLoading
              ? SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(
                    color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                  ),
                ),
              ) 
              : SliverList.builder(
                itemCount: serviceHistoryProvider.serviceHistoryModel!.data.length,
                itemBuilder: (context, index) {
                  return ServiceCardDesign(
                    serviceHistoryData: serviceHistoryProvider.serviceHistoryModel!.data[index],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
