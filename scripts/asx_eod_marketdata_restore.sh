#/bin/sh
#script to load more market data from csv files
data_path=/tmp/asx-eod-turnover/week20191101


for f in $(ls $data_path/*.txt); 
do
echo "$f"
psql -c "copy marketdata from '$f' csv" asx_eod;
done


