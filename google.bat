@echo off
echo ###########################################
echo Generando archivo temporal del pubspec.yaml
echo ###########################################
copy pubspec.yaml pubspec-tmp.yaml
echo ###########################################
echo Combinando archivos gms.ymal con pubspec-tmp.yaml para generar pubspec.ymal para Huawei
echo ###########################################
yaml-merge pubspec-tmp.yaml gms.yaml  > pubspec.yaml
