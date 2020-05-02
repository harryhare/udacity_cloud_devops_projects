@echo off

touch create.bat
touch update.bat
touch delete.bat

rm create.bat
rm update.bat
rm delete.bat


cp create.sh create.bat
cp update.sh update.bat
cp delete.sh delete.bat
