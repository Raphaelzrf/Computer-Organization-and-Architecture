@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Thu Oct 28 17:41:44 +0800 2021
REM SW Build 2552052 on Fri May 24 14:49:42 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim sum_1_tb_behav -key {Behavioral:sim_1:Functional:sum_1_tb} -tclbatch sum_1_tb.tcl -view D:/moshushiyan/lab1/sum_1_tb_behav.wcfg -log simulate.log"
call xsim  sum_1_tb_behav -key {Behavioral:sim_1:Functional:sum_1_tb} -tclbatch sum_1_tb.tcl -view D:/moshushiyan/lab1/sum_1_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
