
import 'package:order_booking_shop/Databases/OrderDatabase/DBHelperOrderMaster.dart';
import 'package:order_booking_shop/Models/OrderModels/OrderMasterModel.dart';


class OrderMasterRepository{

  DBHelperOrderMaster dbHelperOrderMaster = DBHelperOrderMaster();

  Future<List<OrderMasterModel>> getOrderMaster() async{
    var dbClient = await dbHelperOrderMaster.db;
    List<Map> maps = await dbClient.query('orderMaster',columns: ['orderId','shopName','ownerName','phoneNo','brand']);
    List<OrderMasterModel> ordermaster = [];
    for(int i = 0; i<maps.length; i++)
    {
      ordermaster.add(OrderMasterModel.fromMap(maps[i]));
    }
    return ordermaster;
  }

  Future<int> add(OrderMasterModel ordermaster) async{
    var dbClient = await dbHelperOrderMaster.db;
    return await dbClient.insert('orderMaster', ordermaster.toMap());
  }

  Future<int> update(OrderMasterModel ordermaster) async{
    var dbClient = await dbHelperOrderMaster.db;
    return await dbClient.update('orderMaster', ordermaster.toMap(),
        where: 'orderId = ?', whereArgs: [ordermaster.orderId]);
  }


  Future<int> delete(int orderId) async{
    var dbClient = await dbHelperOrderMaster.db;
    return await dbClient.delete('orderMaster',
        where: 'orderId = ?', whereArgs: [orderId]);
  }




}

