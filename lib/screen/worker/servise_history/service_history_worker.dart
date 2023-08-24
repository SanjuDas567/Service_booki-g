import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/worker/auth_provider_worker.dart';
import 'package:glossy_flossy/provider/worker/worker_service_history_provider.dart';
import 'package:glossy_flossy/screen/worker/servise_history/work_details_screen.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:provider/provider.dart';

class ServiceHistoryWorker extends StatefulWidget {
  const ServiceHistoryWorker({super.key});

  @override
  State<ServiceHistoryWorker> createState() => _ServiceHistoryWorkerState();
}

class _ServiceHistoryWorkerState extends State<ServiceHistoryWorker> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black,
            title: Text('Work History'),
          ),
          Consumer<WorkerServiceHistoryProvider>(
            builder: (context, historyProvider, _) {
              return historyProvider.isWorkerServiceHistoryLoading
                  ? const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                        ),
                      ),
                    )
                  : historyProvider.workerHistory!.success == 2
                      ? SliverList.separated(
                          itemCount:
                              historyProvider.workerHistory!.message!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                leading: Text(
                                  '${index + 1}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                title: Text(
                                  historyProvider.workerHistory!.message![index]
                                      .serviceType,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: const Text(
                                  '20/06/2023',
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const WorkDetailsScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Show more ',
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ));
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            );
                          },
                        )
                      : const SliverToBoxAdapter(
                          child: Center(
                            child: Text(
                              'No Service History Found',
                              style: TextStyle(
                                  color: ColorResources.GLOSSY_FLOSSY_WHITE),
                            ),
                          ),
                        );
            },
          )
        ],
      ),
    );
  }

  void getHistory() {
    final workerId =
        Provider.of<AuthProviderWorker>(context, listen: false).getWorkerId();
    Provider.of<WorkerServiceHistoryProvider>(context, listen: false)
        .getServiceHistory(workerId);
  }
}
