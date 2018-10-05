time /t >> bit.log   
sqlplus /nolog @padron.sql 
imp parfile=padron.par	
sqlplus /nolog @contar.sql 
time /t >> bit.log	
start notepad contar.log 