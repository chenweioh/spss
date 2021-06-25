* Encoding: UTF-8.
compute filter = index(Upper(Report), "SAE") >0.
execute.

select if (filter =1).

save outfile ='C:\Users\kiwiw\OneDrive\Education\SPSS\PV\filtered.sav'
/keep=id report.

get file ='C:\Users\kiwiw\OneDrive\Education\SPSS\PV\filtered.sav'.
list.
