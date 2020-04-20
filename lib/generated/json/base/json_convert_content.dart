// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:code_running_front/business/user/models/request/req_add_cart_entity.dart';
import 'package:code_running_front/business/user/models/request/req_del_cart_entity.dart';
import 'package:code_running_front/business/user/models/request/req_execute_code_entity.dart';
import 'package:code_running_front/business/user/models/request/req_get_mall_items_entity.dart';
import 'package:code_running_front/business/user/models/request/req_get_my_cart_entity.dart';
import 'package:code_running_front/business/user/models/request/req_get_my_repository_entity.dart';
import 'package:code_running_front/business/user/models/request/req_login_entity.dart';
import 'package:code_running_front/business/user/models/request/req_register_entity.dart';
import 'package:code_running_front/business/user/models/request/req_reset_password_entity.dart';
import 'package:code_running_front/business/user/models/request/req_send_reset_password_mail_entity.dart';
import 'package:code_running_front/business/user/models/request/req_upload_code_entity.dart';
import 'package:code_running_front/business/user/models/response/resp_execute_code_entity.dart';
import 'package:code_running_front/business/user/models/response/resp_get_code_result_entity.dart';
import 'package:code_running_front/business/user/models/response/resp_get_codes_entity.dart';
import 'package:code_running_front/business/user/models/response/resp_get_mall_items_entity.dart';
import 'package:code_running_front/business/user/models/response/resp_get_my_cart_entity.dart';
import 'package:code_running_front/business/user/models/response/resp_get_my_repository_entity.dart';
import 'package:code_running_front/business/user/models/response/resp_login_entity.dart';
import 'package:code_running_front/business/user/models/response/resp_register_entity.dart';
import 'package:code_running_front/business/user/models/response/resp_upload_code_entity.dart';
import 'package:code_running_front/generated/json/req_add_cart_entity_helper.dart';
import 'package:code_running_front/generated/json/req_del_cart_entity_helper.dart';
import 'package:code_running_front/generated/json/req_execute_code_entity_helper.dart';
import 'package:code_running_front/generated/json/req_get_mall_items_entity_helper.dart';
import 'package:code_running_front/generated/json/req_get_my_cart_entity_helper.dart';
import 'package:code_running_front/generated/json/req_get_my_repository_entity_helper.dart';
import 'package:code_running_front/generated/json/req_login_entity_helper.dart';
import 'package:code_running_front/generated/json/req_register_entity_helper.dart';
import 'package:code_running_front/generated/json/req_reset_password_entity_helper.dart';
import 'package:code_running_front/generated/json/req_send_reset_password_mail_entity_helper.dart';
import 'package:code_running_front/generated/json/req_upload_code_entity_helper.dart';
import 'package:code_running_front/generated/json/resp_execute_code_entity_helper.dart';
import 'package:code_running_front/generated/json/resp_get_code_result_entity_helper.dart';
import 'package:code_running_front/generated/json/resp_get_codes_entity_helper.dart';
import 'package:code_running_front/generated/json/resp_get_mall_items_entity_helper.dart';
import 'package:code_running_front/generated/json/resp_get_my_cart_entity_helper.dart';
import 'package:code_running_front/generated/json/resp_get_my_repository_entity_helper.dart';
import 'package:code_running_front/generated/json/resp_login_entity_helper.dart';
import 'package:code_running_front/generated/json/resp_register_entity_helper.dart';
import 'package:code_running_front/generated/json/resp_upload_code_entity_helper.dart';

class JsonConvert<T> {
  T fromJson(Map<String, dynamic> json) {
    return _getFromJson<T>(runtimeType, this, json);
  }

  Map<String, dynamic> toJson() {
    return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
      case RespUploadCodeEntity:
        return respUploadCodeEntityFromJson(
            data as RespUploadCodeEntity, json) as T;
      case RespUploadCodeData:
        return respUploadCodeDataFromJson(
            data as RespUploadCodeData, json) as T;
      case ReqSendResetPasswordMailEntity:
        return reqSendResetPasswordMailEntityFromJson(
            data as ReqSendResetPasswordMailEntity, json) as T;
      case RespGetMyCartEntity:
        return respGetMyCartEntityFromJson(
            data as RespGetMyCartEntity, json) as T;
      case RespGetMyCartData:
        return respGetMyCartDataFromJson(data as RespGetMyCartData, json) as T;
      case RespGetCodesEntity:
        return respGetCodesEntityFromJson(
            data as RespGetCodesEntity, json) as T;
      case RespGetCodesData:
        return respGetCodesDataFromJson(data as RespGetCodesData, json) as T;
      case ReqDelCartEntity:
        return reqDelCartEntityFromJson(data as ReqDelCartEntity, json) as T;
      case ReqResetPasswordEntity:
        return reqResetPasswordEntityFromJson(
            data as ReqResetPasswordEntity, json) as T;
      case ReqGetMyCartEntity:
        return reqGetMyCartEntityFromJson(
            data as ReqGetMyCartEntity, json) as T;
      case RespRegisterEntity:
        return respRegisterEntityFromJson(
            data as RespRegisterEntity, json) as T;
      case RespRegisterData:
        return respRegisterDataFromJson(data as RespRegisterData, json) as T;
      case ReqRegisterEntity:
        return reqRegisterEntityFromJson(data as ReqRegisterEntity, json) as T;
      case ReqGetMallItemsEntity:
        return reqGetMallItemsEntityFromJson(
            data as ReqGetMallItemsEntity, json) as T;
      case RespGetMallItemsEntity:
        return respGetMallItemsEntityFromJson(
            data as RespGetMallItemsEntity, json) as T;
      case RespGetMallItemsData:
        return respGetMallItemsDataFromJson(
            data as RespGetMallItemsData, json) as T;
      case ReqUploadCodeEntity:
        return reqUploadCodeEntityFromJson(
            data as ReqUploadCodeEntity, json) as T;
      case ReqAddCartEntity:
        return reqAddCartEntityFromJson(data as ReqAddCartEntity, json) as T;
      case RespGetCodeResultEntity:
        return respGetCodeResultEntityFromJson(
            data as RespGetCodeResultEntity, json) as T;
      case RespGetCodeResultData:
        return respGetCodeResultDataFromJson(
            data as RespGetCodeResultData, json) as T;
      case ReqExecuteCodeEntity:
        return reqExecuteCodeEntityFromJson(
            data as ReqExecuteCodeEntity, json) as T;
      case RespGetMyRepositoryEntity:
        return respGetMyRepositoryEntityFromJson(
            data as RespGetMyRepositoryEntity, json) as T;
      case RespGetMyRepositoryData:
        return respGetMyRepositoryDataFromJson(
            data as RespGetMyRepositoryData, json) as T;
      case ReqLoginEntity:
        return reqLoginEntityFromJson(data as ReqLoginEntity, json) as T;
      case RespLoginEntity:
        return respLoginEntityFromJson(data as RespLoginEntity, json) as T;
      case RespLoginData:
        return respLoginDataFromJson(data as RespLoginData, json) as T;
      case ReqGetMyRepositoryEntity:
        return reqGetMyRepositoryEntityFromJson(
            data as ReqGetMyRepositoryEntity, json) as T;
      case RespExecuteCodeEntity:
        return respExecuteCodeEntityFromJson(
            data as RespExecuteCodeEntity, json) as T;
      case RespExecuteCodeData:
        return respExecuteCodeDataFromJson(
            data as RespExecuteCodeData, json) as T;
    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
    switch (type) {
      case RespUploadCodeEntity:
        return respUploadCodeEntityToJson(data as RespUploadCodeEntity);
      case RespUploadCodeData:
        return respUploadCodeDataToJson(data as RespUploadCodeData);
      case ReqSendResetPasswordMailEntity:
        return reqSendResetPasswordMailEntityToJson(
            data as ReqSendResetPasswordMailEntity);
      case RespGetMyCartEntity:
        return respGetMyCartEntityToJson(data as RespGetMyCartEntity);
      case RespGetMyCartData:
        return respGetMyCartDataToJson(data as RespGetMyCartData);
      case RespGetCodesEntity:
        return respGetCodesEntityToJson(data as RespGetCodesEntity);
      case RespGetCodesData:
        return respGetCodesDataToJson(data as RespGetCodesData);
      case ReqDelCartEntity:
        return reqDelCartEntityToJson(data as ReqDelCartEntity);
      case ReqResetPasswordEntity:
        return reqResetPasswordEntityToJson(data as ReqResetPasswordEntity);
      case ReqGetMyCartEntity:
        return reqGetMyCartEntityToJson(data as ReqGetMyCartEntity);
      case RespRegisterEntity:
        return respRegisterEntityToJson(data as RespRegisterEntity);
      case RespRegisterData:
        return respRegisterDataToJson(data as RespRegisterData);
      case ReqRegisterEntity:
        return reqRegisterEntityToJson(data as ReqRegisterEntity);
      case ReqGetMallItemsEntity:
        return reqGetMallItemsEntityToJson(data as ReqGetMallItemsEntity);
      case RespGetMallItemsEntity:
        return respGetMallItemsEntityToJson(data as RespGetMallItemsEntity);
      case RespGetMallItemsData:
        return respGetMallItemsDataToJson(data as RespGetMallItemsData);
      case ReqUploadCodeEntity:
        return reqUploadCodeEntityToJson(data as ReqUploadCodeEntity);
      case ReqAddCartEntity:
        return reqAddCartEntityToJson(data as ReqAddCartEntity);
      case RespGetCodeResultEntity:
        return respGetCodeResultEntityToJson(data as RespGetCodeResultEntity);
      case RespGetCodeResultData:
        return respGetCodeResultDataToJson(data as RespGetCodeResultData);
      case ReqExecuteCodeEntity:
        return reqExecuteCodeEntityToJson(data as ReqExecuteCodeEntity);
      case RespGetMyRepositoryEntity:
        return respGetMyRepositoryEntityToJson(
            data as RespGetMyRepositoryEntity);
      case RespGetMyRepositoryData:
        return respGetMyRepositoryDataToJson(data as RespGetMyRepositoryData);
      case ReqLoginEntity:
        return reqLoginEntityToJson(data as ReqLoginEntity);
      case RespLoginEntity:
        return respLoginEntityToJson(data as RespLoginEntity);
      case RespLoginData:
        return respLoginDataToJson(data as RespLoginData);
      case ReqGetMyRepositoryEntity:
        return reqGetMyRepositoryEntityToJson(data as ReqGetMyRepositoryEntity);
      case RespExecuteCodeEntity:
        return respExecuteCodeEntityToJson(data as RespExecuteCodeEntity);
      case RespExecuteCodeData:
        return respExecuteCodeDataToJson(data as RespExecuteCodeData);
    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {
      case 'RespUploadCodeEntity':
        return RespUploadCodeEntity().fromJson(json);
      case 'RespUploadCodeData':
        return RespUploadCodeData().fromJson(json);
      case 'ReqSendResetPasswordMailEntity':
        return ReqSendResetPasswordMailEntity().fromJson(json);
      case 'RespGetMyCartEntity':
        return RespGetMyCartEntity().fromJson(json);
      case 'RespGetMyCartData':
        return RespGetMyCartData().fromJson(json);
      case 'RespGetCodesEntity':
        return RespGetCodesEntity().fromJson(json);
      case 'RespGetCodesData':
        return RespGetCodesData().fromJson(json);
      case 'ReqDelCartEntity':
        return ReqDelCartEntity().fromJson(json);
      case 'ReqResetPasswordEntity':
        return ReqResetPasswordEntity().fromJson(json);
      case 'ReqGetMyCartEntity':
        return ReqGetMyCartEntity().fromJson(json);
      case 'RespRegisterEntity':
        return RespRegisterEntity().fromJson(json);
      case 'RespRegisterData':
        return RespRegisterData().fromJson(json);
      case 'ReqRegisterEntity':
        return ReqRegisterEntity().fromJson(json);
      case 'ReqGetMallItemsEntity':
        return ReqGetMallItemsEntity().fromJson(json);
      case 'RespGetMallItemsEntity':
        return RespGetMallItemsEntity().fromJson(json);
      case 'RespGetMallItemsData':
        return RespGetMallItemsData().fromJson(json);
      case 'ReqUploadCodeEntity':
        return ReqUploadCodeEntity().fromJson(json);
      case 'ReqAddCartEntity':
        return ReqAddCartEntity().fromJson(json);
      case 'RespGetCodeResultEntity':
        return RespGetCodeResultEntity().fromJson(json);
      case 'RespGetCodeResultData':
        return RespGetCodeResultData().fromJson(json);
      case 'ReqExecuteCodeEntity':
        return ReqExecuteCodeEntity().fromJson(json);
      case 'RespGetMyRepositoryEntity':
        return RespGetMyRepositoryEntity().fromJson(json);
      case 'RespGetMyRepositoryData':
        return RespGetMyRepositoryData().fromJson(json);
      case 'ReqLoginEntity':
        return ReqLoginEntity().fromJson(json);
      case 'RespLoginEntity':
        return RespLoginEntity().fromJson(json);
      case 'RespLoginData':
        return RespLoginData().fromJson(json);
      case 'ReqGetMyRepositoryEntity':
        return ReqGetMyRepositoryEntity().fromJson(json);
      case 'RespExecuteCodeEntity':
        return RespExecuteCodeEntity().fromJson(json);
      case 'RespExecuteCodeData':
        return RespExecuteCodeData().fromJson(json);
    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {
      case 'RespUploadCodeEntity':
        return List<RespUploadCodeEntity>();
      case 'RespUploadCodeData':
        return List<RespUploadCodeData>();
      case 'ReqSendResetPasswordMailEntity':
        return List<ReqSendResetPasswordMailEntity>();
      case 'RespGetMyCartEntity':
        return List<RespGetMyCartEntity>();
      case 'RespGetMyCartData':
        return List<RespGetMyCartData>();
      case 'RespGetCodesEntity':
        return List<RespGetCodesEntity>();
      case 'RespGetCodesData':
        return List<RespGetCodesData>();
      case 'ReqDelCartEntity':
        return List<ReqDelCartEntity>();
      case 'ReqResetPasswordEntity':
        return List<ReqResetPasswordEntity>();
      case 'ReqGetMyCartEntity':
        return List<ReqGetMyCartEntity>();
      case 'RespRegisterEntity':
        return List<RespRegisterEntity>();
      case 'RespRegisterData':
        return List<RespRegisterData>();
      case 'ReqRegisterEntity':
        return List<ReqRegisterEntity>();
      case 'ReqGetMallItemsEntity':
        return List<ReqGetMallItemsEntity>();
      case 'RespGetMallItemsEntity':
        return List<RespGetMallItemsEntity>();
      case 'RespGetMallItemsData':
        return List<RespGetMallItemsData>();
      case 'ReqUploadCodeEntity':
        return List<ReqUploadCodeEntity>();
      case 'ReqAddCartEntity':
        return List<ReqAddCartEntity>();
      case 'RespGetCodeResultEntity':
        return List<RespGetCodeResultEntity>();
      case 'RespGetCodeResultData':
        return List<RespGetCodeResultData>();
      case 'ReqExecuteCodeEntity':
        return List<ReqExecuteCodeEntity>();
      case 'RespGetMyRepositoryEntity':
        return List<RespGetMyRepositoryEntity>();
      case 'RespGetMyRepositoryData':
        return List<RespGetMyRepositoryData>();
      case 'ReqLoginEntity':
        return List<ReqLoginEntity>();
      case 'RespLoginEntity':
        return List<RespLoginEntity>();
      case 'RespLoginData':
        return List<RespLoginData>();
      case 'ReqGetMyRepositoryEntity':
        return List<ReqGetMyRepositoryEntity>();
      case 'RespExecuteCodeEntity':
        return List<RespExecuteCodeEntity>();
      case 'RespExecuteCodeData':
        return List<RespExecuteCodeData>();
    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}