import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocket/services/http_service.dart';

class AddAssetDialogController extends GetxController {
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _getAssets();
  }

  Future<void> _getAssets() async {
    loading.value = true;
    HttpService httpService = Get.find<HttpService>();
    try {
      var responseData = await httpService.get("currencies");
      print("API Response: $responseData");
    } catch (e) {
      print("Error fetching assets: $e");
    } finally {
      loading.value = false;
    }
  }
}


class AddAssetDialog extends StatelessWidget {
  final controller = Get.put(AddAssetDialogController());
  AddAssetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: Material(
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.40,
            width: MediaQuery.sizeOf(context).width * 0.80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: _buildUI(),
          ),
        ),
      ),
    );
  }

  Widget _buildUI() {
    if (controller.loading.isTrue) {
      return const Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Column(
        children: [],
      );
    }
  }
}
