@ echo off
setlocal enabledelayedexpansion
rem set sed="C:\Program Files\Git\usr\bin\sed.exe"
echo "grep log step"
echo %Project_path%
echo %1
set target=%1
rem echo !target!
set target1=!target:*/=!
set target2=!target1:*/=!
set target2=!target2:*/=!
set target2=!target2:*/=!
set model=!target2:.yml=!
echo !model!
set log_path=log
cd %Project_path%
dir

echo "train_win_gpu"|findstr %2 >nul
if !errorlevel! equ 0 (
    echo '#####train_win_gpu'
    type %log_path%\!model!_train.log | findstr training_exit_code
    type %log_path%\!model!_train.log | findstr training_exit_code >> ..\%log_path%\!model!_train.log
    type ..\%log_path%\!model!_train.log
)

echo "train_win_cpu"|findstr %2 >nul
if !errorlevel! equ 0 (
    echo '#####train_win_cpu'
    type %log_path%\!model!_train.log | findstr training_exit_code
    type %log_path%\!model!_train.log | findstr training_exit_code >> ..\%log_path%\!model!_train.log
    type ..\%log_path%\!model!_train.log
)

echo "eval_win"|findstr %2 >nul
if !errorlevel! equ 0 (
    echo '#####eval_win'
    type %log_path%\!model!_eval.log | findstr eval_exit_code
    type %log_path%\!model!_eval.log | findstr eval_exit_code >> ..\%log_path%\!model!_eval.log
    type ..\%log_path%\!model!_eval.log
)

echo "infer_win"|findstr %2 >nul
if !errorlevel! equ 0 (
    echo '#####infer_win'
    type %log_path%\!model!_infer.log | findstr infer_exit_code
    type %log_path%\!model!_infer.log | findstr infer_exit_code > ..\%log_path%\!model!_infer.log
    type ..\%log_path%\!model!_infer.log
)

echo "export_win"|findstr %2 >nul
if !errorlevel! equ 0 (
    echo '#####export_win'
    type %log_path%\!model!_export.log | findstr export_exit_code
    type %log_path%\!model!_export.log | findstr export_exit_code > ..\%log_path%\!model!_export.log
    type ..\%log_path%\!model!_export.log
)

echo "predict_win"|findstr %2 >nul
if !errorlevel! equ 0 (
    echo '#####predict_win'
    type %log_path%\!model!_predict.log | findstr predict_exit_code
    type %log_path%\!model!_predict.log | findstr predict_exit_code > ..\%log_path%\!model!_predict.log
    type ..\%log_path%\!model!_predict.log
)
