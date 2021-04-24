import 'package:firebase_database/firebase_database.dart';

class Posts {
  String dolocationID,
      pulocationID,
      ratecodeID,
      vendorID,
      congestion_surcharge,
      extra,
      fare_amount,
      improvement_surcharge,
      mta_tax,
      passenger_count,
      payment_type,
      store_and_fwd_flag,
      tip_amount,
      tolls_amount,
      total_amount,
      tpep_dropoff_datetime,
      tpep_pickup_datetime,
      trip_distance;

  Posts(
      {this.dolocationID,
      this.pulocationID,
      this.ratecodeID,
      this.vendorID,
      this.congestion_surcharge,
      this.extra,
      this.fare_amount,
      this.improvement_surcharge,
      this.mta_tax,
      this.passenger_count,
      this.payment_type,
      this.store_and_fwd_flag,
      this.tip_amount,
      this.tolls_amount,
      this.total_amount,
      this.tpep_dropoff_datetime,
      this.tpep_pickup_datetime,
      this.trip_distance});

  Posts.fromJson(Map<String, dynamic> json) {
    dolocationID = json["DOLocationID"];
    pulocationID = json["PULocationID"];
    ratecodeID = json["RatecodeID"];
    vendorID = json["VendorID"];
    congestion_surcharge = json["congestion_surcharge"];
    extra = json["extra"];
    fare_amount = json["fare_amount"];
    improvement_surcharge = json["improvement_surcharge"];
    mta_tax = json["mta_tax"];
    passenger_count = json["passenger_count"];
    payment_type = json["payment_type"];
    store_and_fwd_flag = json["store_and_fwd_flag"];
    tip_amount = json["tip_amount"];
    tolls_amount = json["tolls_amount"];
    total_amount = json["total_amount"];
    tpep_dropoff_datetime = json["tpep_dropoff_datetime"];
    tpep_pickup_datetime = json["tpep_pickup_datetime"];
    trip_distance = json["trip_distance"];
  }

  Map<String, dynamic> fromJson() {
    return {
      "DOLocationID": dolocationID,
      "PULocationID": pulocationID,
      "RatecodeID": ratecodeID,
      "VendorID": vendorID,
      "congestion_surcharge": congestion_surcharge,
      "extra": extra,
      "fare_amount": fare_amount,
      "improvement_surcharge": improvement_surcharge,
      "mta_tax": mta_tax,
      "passenger_count": passenger_count,
      "payment_type": payment_type,
      "store_and_fwd_flag": store_and_fwd_flag,
      "tip_amount": tip_amount,
      "tolls_amount": tolls_amount,
      "total_amount": total_amount,
      "tpep_dropoff_datetime": tpep_dropoff_datetime,
      "tpep_pickup_datetime": tpep_pickup_datetime,
      "trip_distance": trip_distance,
    };
  }
}
