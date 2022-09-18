* Encoding: UTF-8.
begin program.
import spss, spssaux

varlist=['varA','varB','varC','varD','varE'] #All the variable in dataset
catlist=['varA','varC',varE] #variable to be treated as categorical variable
numlist=['varB','varD'] #variable to be treated as numerical variable

dim = len(varlist)
for i in range(dim):
    num=("{:03d}".format(i))
    if list[i] in catlist:
        myivar = list[i] 
        spss.Submit(r"""                   
                                    OUTPUT NEW.
                                
                                    *Analysis.
                                    FREQUENCIES VARIABLES=%s.
                                        
                                    * Export Output excel.
                                    OUTPUT EXPORT  
                                      /CONTENTS  EXPORT=ALL  LAYERS=PRINTSETTING  MODELVIEWS=PRINTSETTING
                                      /XLSX  DOCUMENTFILE='C:\Users\Excel\%s_freq_%s.xlsx'
                                         OPERATION=CREATEFILE
                                         LOCATION=LASTCOLUMN  NOTESCAPTIONS=YES.
                                    
                                    OUTPUT CLOSE *.  
 
                                """ %(myivar,num,myivar))
                                
    elif list[i] in numlist:
        myivar = list[i] 
        spss.Submit(r"""                   
                                    OUTPUT NEW.
                                
                                *Analysis.
                                EXAMINE VARIABLES=%s
                                  /PLOT BOXPLOT HISTOGRAM NPPLOT.
                                   
                                * Export Output excel.
                                OUTPUT EXPORT  
                                  /CONTENTS  EXPORT=ALL  LAYERS=PRINTSETTING  MODELVIEWS=PRINTSETTING
                                  /XLSX  DOCUMENTFILE='C:\Users\\Excel\%s_expl_%s.xlsx'
                                     OPERATION=CREATEFILE
                                     LOCATION=LASTCOLUMN  NOTESCAPTIONS=YES.
                                
                                OUTPUT CLOSE *.  
 
                                """ %(myivar,num,myivar))
end program.







