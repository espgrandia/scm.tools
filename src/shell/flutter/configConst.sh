#!/bin/bash

# @brief : 宣告 flutter 輔助工具會用到的 const value。
#  - 初期是給 exported.sh 以及實作曾專案的使用，後來有擴大使用範圍。
#
# @details :
#  - 目前會使用到的 shell
#    - configTools.sh
#    - exported.sh
#    - flutterExtensionTools.sh
#    - releaseNoteTools.sh
#  - 部分內容會給使用 exported.sh 參考使用。
#

## ================================== buildConfig Required section : Begin ==================================

### ---------------------------------- flutter command section : Begin ----------------------------------
# @brief : 透過 flutter 通用的。

# flutter 的 command name
configConst_CommandName_Flutter="flutter"

### ---------------------------------- flutter command section : End ----------------------------------

### ---------------------------------- subcommand key section : Begin ----------------------------------
# @brief for flutter subcommand
# @detail - 目前 flutter build 支援的 subcommands，flutter version (2.2.3)。
#  - shell 不支援 export array，所以就沒提供 flutter 以及 exported 目前支援或提供的 subcommand 功能。
# @sa
#   - configTools.sh 中 configTools_Gen_Required 參數可參考此區塊來設定
#   - exported.sh 會使用到。
export configConst_Subcommand_aar="aar"
export configConst_Subcommand_apk="apk"
export configConst_Subcommand_appbundle="appbundle"
export configConst_Subcommand_bundle="bundle"
export configConst_Subcommand_ios="ios"
export configConst_Subcommand_ios_framework="ios-framework"
export configConst_Subcommand_ipa="ipa"
export configConst_Subcommand_web="web"


# 目前 flutter build 提供的 subcommands，flutter version (2.2.3)。
export configConst_Flutter_Provide_Subcommands_String="${configConst_Subcommand_aar} ${configConst_Subcommand_apk}\
 ${configConst_Subcommand_appbundle} ${configConst_Subcommand_bundle}\
 ${configConst_Subcommand_ios} ${configConst_Subcommand_ios_framework} ${configConst_Subcommand_ipa}\
 ${configConst_Subcommand_web}"

# 目前 exported.sh 提供的 subcommands。
export configConst_Exported_Shell_Provide_Subcommands_String="${configConst_Subcommand_apk}\
 ${configConst_Subcommand_appbundle}\
 ${configConst_Subcommand_ios} ${configConst_Subcommand_ipa}"

### ---------------------------------- subcommand key section : End ----------------------------------

## ================================== buildConfig Required section : End ==================================


## ================================== buildConfig Optional section : Begin ==================================

### ---------------------------------- fvm mode section : Begin ----------------------------------
# @brief : 透過 fvm (Flutter Version Management) 用來管理 Flutter Version 切換功能。
# @details : exported.sh 目前主要是支援 fvm 來呼叫 flutter 命令。
#  有使用 fvm 功能時，則會以該專案的 local active 設定為主來執行 flutter 版本。
#  - e.g. 實際使用方式 :
#    > fvm flutter build ...
# @author : esp
# @create date : 2021-08-16
# @sa FVM website : https://fvm.app/
#

# config file 中， Optional 關於 
export configConst_ConfigKey_Fvm_Is_Enable_Fvm_Mode="is_enable_fvm_mode"

# fvm 的 command line 的名稱。
export configConst_CommandName_Fvm="fvm"

### ---------------------------------- fvm mode section : End ----------------------------------

### ---------------------------------- buildConfigType key section : Begin ----------------------------------
# 支援的 subcommand : [apk] [appbundle] [bundle] [ios]。
# 依據 flutter build ， 有 debug ， profile ， release
export configConst_BuildConfigType_Debug="debug"
export configConst_BuildConfigType_Profile="profile"
export configConst_BuildConfigType_Release="release"

### ---------------------------------- buildConfigType key section : End ----------------------------------

### ---------------------------------- ToogleFeature key section : Begin ----------------------------------
# @brief 針對 flutter build [subcommand] 的後續參數，屬於開關性質的設定。
# @details 
#  - optional 的功能。
#  - 有設定則表示需要開啟此功能，使用者可設定需要的參數給 configTools.sh 的某個函式 (TODO: 尚未支援)。
#  - exported.sh 會依照此 subcommand 有支援的 feature 來帶入。

# 不更新 pub。
export configConst_BuildParam_ToggleFeature_NoPub="no-pub"
### ================================== ToogleFeature key section : End ==================================

### ---------------------------------- Parm that needed contains value section : Begin ----------------------------------
# @brief 針對 flutter build [subcommand] 的後續參數，屬於需要額外帶入內容的項目。
# @details 
#  - optional 的功能。
#  - confitTools.sh 會用到此區塊的 key，使用者只需要呼叫對應的函式即可。
#  - exported.sh 會依照 build config 的相關設定來處理。

# [build-name] 指定編譯的 build name。
#   - flutter pubspec.yaml 中 version : [Build_Name]+[Build_Number]。
#     一般對應於上面的 [Build_Name]，有設定則會當作產出的檔案名稱一環。
#   - 預設 : 沒指定時，flutter build 會預設為下面的 [Build_Name]
#     pubspec.yaml 的 version : [Build_Name]+[Build_Number]，但檔案名稱沒有對應內容。
export configConst_BuildParam_Key_BuildName="build-name"

# [build-number] 指定編譯的 build number。
#   - flutter pubspec.yaml 中 version : [Build_Name]+[Build_Number]。
#     一般對應於上面的 [Build_Number]，有設定則會當作產出的檔案名稱一環。
#   - 預設 : 沒指定時，flutter build 會預設為下面的 [Build_Number]
#     pubspec.yaml 的 version : [Build_Name]+[Build_Number]，但檔案名稱沒有對應內容。
export configConst_BuildParam_Key_BuildNumber="build-number"

# [dart-define] 設定 dart 的環境變數，可於 dart 層取得。
export configConst_BuildParam_Key_DartDefine="dart-define"

# [flavor] 依照 flavor 來做編譯，Android 為 flavor， iOS 為 Xcode schemes。
export configConst_BuildParam_Key_Flavor="flavor"

# [target-platform] 設定 Android 的發佈平台。
export configConst_BuildParam_Key_TargetPlatform="target-platform"

# [target-platform] [value] Android 的發佈平台可設定的 value [android-arm (default), android-arm64 (default), android-x86, android-x64 (default)]
export configConst_BuildParam_TargetPlatform_arm="android-arm"
export configConst_BuildParam_TargetPlatform_arm64="android-arm64"
export configConst_BuildParam_TargetPlatform_x86="android-x86"
export configConst_BuildParam_TargetPlatform_x64="android-x64"
### ---------------------------------- Parm that needed contains value section : End ----------------------------------

### ---------------------------------- config (yaml) key that needed contains value section : Begin ----------------------------------
# @brief 針對 config file (yaml) 會用到的 key，於此定義。
# @detail 首先會用到的是 confitTools.sh，其餘的 exported.sh 看看是否能使用。

# for config key。
export configConst_ConfigKey_Optional="optional"

# 產出的檔案名稱，加上 前綴字 (prefix)。
export configConst_ConfigKey_Prefix_FileName="prefix_file_name"

### ---------------------------------- config key (yaml) that needed contains value section : End ----------------------------------

## ================================== buildConfig Optional section : End ==================================