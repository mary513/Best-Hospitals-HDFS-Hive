


tail -n +2 'Timely and Effective Care - Hospital.csv' > timelyHosp
tail -n +2 'Timely and Effective Care - State.csv' > timelyState
tail -n +2 'HCAHPS - Hospital.csv' > patsurv
tail -n +2 'Readmissions and Deaths - Hospital.csv' > readmit
tail -n +2 'Complications - Hospital.csv' > comp
tail -n +2 'Healthcare Associated Infections - Hospital.csv' > infect

hdfs dfs -mkdir /user/w205/hospcomp

hdfs dfs -mkdir /user/w205/hospcomp/timelyHosp
hdfs dfs -put timelyHosp /user/w205/hospcomp/timelyHosp

hdfs dfs -mkdir /user/w205/hospcomp/timelyState
hdfs dfs -put timelyState /user/w205/hospcomp/timelyState

hdfs dfs -mkdir /user/w205/hospcomp/patsurv
hdfs dfs -put patsurv /user/w205/hospcomp/patsurv

hdfs dfs -mkdir /user/w205/hospcomp/readmit
hdfs dfs -put readmit /user/w205/hospcomp/readmit

hdfs dfs -mkdir /user/w205/hospcomp/comp
hdfs dfs -put comp /user/w205/hospcomp/comp

hdfs dfs -mkdir /user/w205/hospcomp/infect
hdfs dfs -put infect /user/w205/hospcomp/infect


