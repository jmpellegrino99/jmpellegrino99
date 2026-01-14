rem FOR %i IN (*.pdf) DO "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe" /N /T "%i" "Brother MFC-L2820DW Printer"


@echo off
setlocal

rem Set the path to Adobe Acrobat and the printer name
set acrobatPath="C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"
set printerName="Brother MFC-L2820DW Printer"
set destinationFolder="C:\Users\larry\Downloads\"

rem Iterate over all PDF files in the current directory
FOR %%i IN (*.pdf) DO (
    rem Print the PDF file
    %acrobatPath% /N /T "%%i" %printerName%

    rem Move the PDF file to the destination folder after printing
    rem move "%%i" %destinationFolder%
)

endlocal
