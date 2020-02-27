import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:learn_ff/view_code.dart';
import 'dart:io';

import '../asset_utils.dart';

class DeviceDemo extends StatefulWidget{
  @override
  _DeviceDemoState createState() {
    return new _DeviceDemoState();
  }

}

class _DeviceDemoState extends State<DeviceDemo>{

  String deviceInfo = '';

  @override
  void initState() {
    this._genDeviceInfo().then((value){
      setState(() {
        if(Platform.isAndroid){
          AndroidDeviceInfo info = value;
          this.deviceInfo = '''
            version: \t\t\t\t ${info.version} \n
            board: \t\t\t\t ${info.board} \n
            bootloader: \t\t\t\t ${info.bootloader} \n
            brand: \t\t\t\t ${info.brand} \n
            device: \t\t\t\t ${info.device} \n
            display: \t\t\t\t ${info.display} \n
            fingerprint: \t\t\t\t ${info.fingerprint} \n
            hardware: \t\t\t\t ${info.hardware} \n
            host: \t\t\t\t ${info.host} \n
            id: \t\t\t\t ${info.id} \n
            manufacturer: \t\t\t\t ${info.manufacturer} \n
            model: \t\t\t\t ${info.model} \n
            product: \t\t\t\t ${info.product} \n
            tags: \t\t\t\t ${info.tags} \n
            type: \t\t\t\t ${info.type} \n
            isPhysicalDevice: \t\t\t\t ${info.isPhysicalDevice} \n
            androidId: \t\t\t\t ${info.androidId} \n
          ''';
        }else if(Platform.isIOS){
          IosDeviceInfo info = value;
          this.deviceInfo = '''
            name:\t\t\t\t${info.name} \n
            systemName:\t\t\t\t${info.systemName} \n
            systemVersion:\t\t\t\t${info.systemVersion} \n
            model:\t\t\t\t${info.model} \n
            localizedModel:\t\t\t\t${info.localizedModel} \n
            identifierForVendor:\t\t\t\t${info.identifierForVendor} \n
            isPhysicalDevice:\t\t\t\t${info.isPhysicalDevice} \n
            utsname:\t\t\t\t${info.utsname}
          ''';
        }
      });
    });
    super.initState();
  }

  Future<dynamic> _genDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if(Platform.isAndroid){
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo;
    }else if(Platform.isIOS){
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设备信息示例"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.rate_review),
            tooltip: '查看代码实现',
            onPressed: ()=> {
              AssetsUtils.loadAssetsString("doc/device_demo.txt").then(
                (value){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return new ViewCode(title: '设备信息代码实现', content: value);
                    }));
                }
              ).catchError(
                (error){
                  print("error happened! $error");
                }
              )
            }
          )
        ],
      ),
      body: Container(
       color: Colors.blueGrey,
       child: Center(
        child: Text(deviceInfo), 
       ), 
      ),
    );
  }

}