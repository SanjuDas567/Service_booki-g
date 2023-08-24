import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/user/login_provider_user.dart';
import 'package:glossy_flossy/provider/user/service_history_provider.dart';
import 'package:glossy_flossy/screen/user/service_history_screen/widgets/service_card_design.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:provider/provider.dart';

class ServiceHistoryScreen extends StatefulWidget {
  const ServiceHistoryScreen({super.key});

  @override
  State<ServiceHistoryScreen> createState() => _ServiceHistoryScreenState();
}

class _ServiceHistoryScreenState extends State<ServiceHistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistoryData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.black,
            title: Text('Service History'),
          ),
          Consumer<ServiceHistoryProvider>(
            builder: (context, serviceHistoryProvider, child) {
              return serviceHistoryProvider.isServiceHistoryLoading
              ? const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(
                    color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                  ),
                ),
              )
              : serviceHistoryProvider.serviceHistoryModel!.success == 2
              ? SliverList.builder(
                itemCount: serviceHistoryProvider.serviceHistoryModel!.data?.length,
                itemBuilder: (context, index) {
                  return ServiceCardDesign(
                    serviceHistoryData: serviceHistoryProvider.serviceHistoryModel!.data![index],
                  );
                },
              )
              : SliverToBoxAdapter(
                child: Center(
                  child: Text('No Service History Found',style: TextStyle(
                    color: ColorResources.GLOSSY_FLOSSY_WHITE
                  ),),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  void getHistoryData() {
    final userId =
    Provider.of<AuthProvider>(context, listen: false).getUserId();
    Provider.of<ServiceHistoryProvider>(context, listen: false)
        .getServiceData(userId.toString());
  }
}
